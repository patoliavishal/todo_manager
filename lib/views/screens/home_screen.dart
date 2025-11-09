import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_manager/models/models.dart';
import 'package:todo_manager/viewmodels/viewmodels.dart';
import 'package:todo_manager/views/screens/create_task_screen.dart';
import 'package:todo_manager/views/screens/login_screen.dart';
import 'package:todo_manager/views/screens/task_detail_screen.dart';
import 'package:todo_manager/views/widgets/components.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Scaffold(body: Center(child: Text('Error: $error'))),
      data: (user) {
        if (user == null) {
          return const LoginScreen();
        }
        return _buildHomeScreen();
      },
    );
  }

  Widget _buildHomeScreen() {
    final userTasks = ref.watch(userTasksProvider);
    final sharedTasks = ref.watch(sharedTasksProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authViewModelProvider.notifier).signOut();
            },
            tooltip: 'Sign Out',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'My Tasks'),
            Tab(text: 'Shared with Me'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          userTasks.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
            data: (tasks) => TaskListView(
              tasks: tasks,
              scrollController: _scrollController,
              onTaskTap: (task) => () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetailScreen(task: task)));
              },
              onDelete: (task) =>
                  () => _showDeleteConfirmation(task),
              onToggle: (task) =>
                  () => _toggleTask(task),
              onShare: (task) =>
                  () => _showShareDialog(task),
            ),
          ),
          sharedTasks.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
            data: (tasks) => TaskListView(
              tasks: tasks,
              scrollController: _scrollController,
              onTaskTap: (task) => () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TaskDetailScreen(task: task)));
              },
              onDelete: (task) =>
                  () => _showDeleteConfirmation(task),
              onToggle: (task) =>
                  () => _toggleTask(task),
              onShare: (task) =>
                  () => _showShareDialog(task),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _toggleTask(Task task) {
    final viewModel = ref.read(taskViewModelProvider.notifier);
    viewModel.toggleTaskCompletion(task);
  }

  void _showDeleteConfirmation(Task task) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              final viewModel = ref.read(taskViewModelProvider.notifier);
              viewModel.deleteTask(task.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task deleted')));
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showShareDialog(Task task) {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Share Task'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomInputField(label: 'User Email', hintText: 'Enter email to share', controller: emailController),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  final shareText = 'Check out my task: ${task.title}\n${task.description}';
                  Share.share(shareText);
                },
                icon: const Icon(Icons.share),
                label: const Text('Share via App'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              if (emailController.text.isNotEmpty) {
                final viewModel = ref.read(taskViewModelProvider.notifier);
                viewModel.shareTask(task.id, emailController.text);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task shared successfully')));
              }
            },
            child: const Text('Share'),
          ),
        ],
      ),
    );
  }
}
