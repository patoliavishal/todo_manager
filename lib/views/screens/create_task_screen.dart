import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_manager/viewmodels/viewmodels.dart';
import 'package:todo_manager/views/widgets/components.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedPriority = 'medium';
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveConstraints.isMobile(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Task')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ResponsiveConstraints.getPadding(context)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInputField(label: 'Task Title', hintText: 'Enter task title', controller: _titleController),
                const SizedBox(height: 16),
                CustomInputField(label: 'Description', hintText: 'Enter task description', controller: _descriptionController, maxLines: 4),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Priority', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(value: 'low', label: Text('Low')),
                        ButtonSegment(value: 'medium', label: Text('Medium')),
                        ButtonSegment(value: 'high', label: Text('High')),
                      ],
                      selected: {_selectedPriority},
                      onSelectionChanged: (newSelection) {
                        setState(() {
                          _selectedPriority = newSelection.first;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                PrimaryButton(label: 'Create Task', isLoading: _isLoading, onPressed: () => _createTask()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createTask() async {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a task title')));
      return;
    }

    setState(() => _isLoading = true);
    try {
      final userId = ref.read(userIdProvider);
      final viewModel = ref.read(taskViewModelProvider.notifier);

      if (userId == null) {
        throw Exception('User not authenticated');
      }
      await viewModel.createTask(title: _titleController.text, description: _descriptionController.text, ownerId: userId, priority: _selectedPriority);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task created successfully')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
