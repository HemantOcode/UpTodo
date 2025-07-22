import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/core/theme/theme.dart';
import 'package:uptodo/models/task_model.dart';
import 'package:uptodo/providers/task_provider.dart';

class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({super.key});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  void _submit() {
    final title = _titleController.text.trim();
    final desc = _descController.text.trim();

    if (title.isEmpty) return;

    final newTask = Task(
      title: title,
      description: desc,
      createdAt: DateTime.now(),
    );

    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Task'),
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(color: AppColors.text),
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descController,
              style: const TextStyle(color: AppColors.text),
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primarybtn,
              ),
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}
