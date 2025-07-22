import 'package:flutter/material.dart';
import 'package:uptodo/core/theme/theme.dart';
import 'package:uptodo/providers/task_provider.dart';
import 'package:uptodo/widgets/%20search_bar.dart';
import '../../widgets/task_tile.dart';
import 'task_form_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        backgroundColor: AppColors.background,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SearchBarWidget(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskProvider.tasks.length,
              itemBuilder: (ctx, index) {
                final task = taskProvider.tasks[index];
                return TaskTile(
                  title: task.title,
                  date: task.createdAt,
                  initialChecked: task.isCompleted,
                  onChanged: (value) {
                    taskProvider.toggleTask(task);
                  },
                  onDelete: () {
                    taskProvider.deleteTask(task.id!);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primarybtn,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TaskFormScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
