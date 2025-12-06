import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:clean_architecture_todo/ui/notifier/add_task_view_model.dart';
import 'package:clean_architecture_todo/ui/notifier/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskPage extends ConsumerWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク追加'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'タイトル',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: '詳細',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final title = titleController.text;
                if (title.isEmpty) {
                  // 簡単なバリデーション
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('タイトルを入力してください')),
                  );
                  return;
                }
                await ref.read(addTaskViewModelProvider.notifier).addTask(
                      title: title,
                      description: descriptionController.text,
                      dueDate: DateTime.now().add(const Duration(days: 1)), // 仮
                      priority: Priority.medium, // 仮
                    );
                // タスク一覧ページに戻る
                ref.read(homeViewModelProvider.notifier).onPageChanged(0);
              },
              child: const Text('追加'),
            ),
          ],
        ),
      ),
    );
  }
}
