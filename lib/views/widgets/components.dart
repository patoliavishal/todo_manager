import 'package:flutter/material.dart';
import 'package:todo_manager/models/models.dart';

class ResponsiveConstraints {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1000;

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= mobileBreakpoint && MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= tabletBreakpoint;

  static double getPadding(BuildContext context) {
    if (isMobile(context)) return 12.0;
    if (isTablet(context)) return 16.0;
    return 24.0;
  }

  static double getTaskCardWidth(BuildContext context) {
    if (isMobile(context)) return double.infinity;
    if (isTablet(context)) return MediaQuery.of(context).size.width * 0.45;
    return MediaQuery.of(context).size.width * 0.3;
  }
}

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CustomInputField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          maxLines: maxLines,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onToggle;
  final VoidCallback onShare;

  const TaskCard({
    Key? key,
    required this.task,
    required this.onTap,
    required this.onDelete,
    required this.onToggle,
    required this.onShare,
  }) : super(key: key);

  Color getPriorityColor() {
    switch (task.priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(ResponsiveConstraints.getPadding(context) / 2),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(ResponsiveConstraints.getPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(value: task.isCompleted, onChanged: (_) => onToggle()),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(decoration: task.isCompleted ? TextDecoration.lineThrough : null, fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(color: getPriorityColor().withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            task.priority,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: getPriorityColor(), fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(task.description, style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shared: ${task.sharedWith.length}', style: Theme.of(context).textTheme.labelSmall),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.share, size: 20), onPressed: onShare, tooltip: 'Share task'),
                      IconButton(icon: const Icon(Icons.delete, size: 20), onPressed: onDelete, tooltip: 'Delete task'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskListView extends StatelessWidget {
  final List<Task> tasks;
  final VoidCallback Function(Task) onTaskTap;
  final VoidCallback Function(Task) onDelete;
  final VoidCallback Function(Task) onToggle;
  final VoidCallback Function(Task) onShare;
  final ScrollController? scrollController;

  const TaskListView({
    Key? key,
    required this.tasks,
    required this.onTaskTap,
    required this.onDelete,
    required this.onToggle,
    required this.onShare,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_alt, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text('No tasks yet', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[600])),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = ResponsiveConstraints.isDesktop(context) || ResponsiveConstraints.isTablet(context);

        if (isWideScreen) {
          return GridView.builder(
            controller: scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ResponsiveConstraints.isDesktop(context) ? 3 : 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: ResponsiveConstraints.getPadding(context),
              mainAxisSpacing: ResponsiveConstraints.getPadding(context),
            ),
            padding: EdgeInsets.all(ResponsiveConstraints.getPadding(context)),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskCard(task: task, onTap: onTaskTap(task), onDelete: onDelete(task), onToggle: onToggle(task), onShare: onShare(task));
            },
          );
        }

        return ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.all(ResponsiveConstraints.getPadding(context)),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return TaskCard(task: task, onTap: onTaskTap(task), onDelete: onDelete(task), onToggle: onToggle(task), onShare: onShare(task));
          },
        );
      },
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: isLoading ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)) : Text(label),
      ),
    );
  }
}

