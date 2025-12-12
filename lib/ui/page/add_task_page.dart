import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:clean_architecture_todo/ui/navigator/navigator.dart';
import 'package:clean_architecture_todo/ui/notifier/add_task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskPage extends ConsumerWidget {
  AddTaskPage({super.key});

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  useEffect() {
    return () {
      _titleController.dispose();
      _descriptionController.dispose();
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addTaskViewModelProvider);
    final notifier = ref.read(addTaskViewModelProvider.notifier);
    final navigator = ref.read(navigatorProvider);

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
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'タイトル',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '詳細',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('期限:'),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: state.dueDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      notifier.setDueDate(date);
                    }
                  },
                  child: Text(
                    '${state.dueDate.year}/${state.dueDate.month}/${state.dueDate.day}',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text('優先度:'),
                const SizedBox(width: 8),
                DropdownButton<Priority>(
                  value: state.priority,
                  onChanged: (priority) {
                    if (priority != null) {
                      notifier.setPriority(priority);
                    }
                  },
                  items: Priority.values
                      .map(
                        (priority) => DropdownMenuItem(
                          value: priority,
                          child: Text(priority.name),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final title = _titleController.text;
                if (title.isEmpty) {
                  // 簡単なバリデーション
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('タイトルを入力してください')),
                  );
                  return;
                }
                await notifier.addTask(
                  title: title,
                  description: _descriptionController.text,
                );
                // 前のページに戻る
                navigator.pop();
              },
              child: const Text('追加'),
            ),
          ],
        ),
      ),
    );
  }
}
