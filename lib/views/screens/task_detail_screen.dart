import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_manager/models/models.dart';
import 'package:todo_manager/viewmodels/viewmodels.dart';
import 'package:todo_manager/views/widgets/components.dart';

class TaskDetailScreen extends ConsumerStatefulWidget {
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  ConsumerState<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends ConsumerState<TaskDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late String _selectedPriority;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(text: widget.task.description);
    _selectedPriority = widget.task.priority;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final watchTask = ref.watch(watchTaskProvider(widget.task.id));
    final isMobile = ResponsiveConstraints.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        actions: [IconButton(icon: const Icon(Icons.delete), onPressed: () => _deleteTask())],
      ),
      body: watchTask.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (currentTask) {
          if (currentTask == null) {
            return const Center(child: Text('Task not found'));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(ResponsiveConstraints.getPadding(context)),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInputField(label: 'Title', hintText: 'Task title', controller: _titleController),
                    const SizedBox(height: 16),
                    CustomInputField(label: 'Description', hintText: 'Task description', controller: _descriptionController, maxLines: 4),
                    const SizedBox(height: 16),
                    CheckboxListTile(title: const Text('Mark as completed'), value: currentTask.isCompleted, onChanged: (_) => _toggleCompletion(currentTask)),
                    const SizedBox(height: 16),
                    Text('Shared with: ${currentTask.sharedWith.length} user(s)', style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(height: 24),
                    PrimaryButton(label: 'Save Changes', onPressed: () => _saveChanges(currentTask)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _saveChanges(Task task) async {
    final viewModel = ref.read(taskViewModelProvider.notifier);
    final updatedTask = task.copyWith(title: _titleController.text, description: _descriptionController.text, priority: _selectedPriority);

    await viewModel.updateTask(updatedTask);

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task updated successfully')));
    }
  }

  Future<void> _toggleCompletion(Task task) async {
    final viewModel = ref.read(taskViewModelProvider.notifier);
    await viewModel.toggleTaskCompletion(task);
  }

  Future<void> _deleteTask() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final viewModel = ref.read(taskViewModelProvider.notifier);
      await viewModel.deleteTask(widget.task.id);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task deleted successfully')));
      }
    }
  }
}
