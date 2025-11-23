import 'package:clean_architecture_todo/domain/entity/task.dart';
import 'package:clean_architecture_todo/ui/component/add_task_sheet.dart';
import 'package:clean_architecture_todo/ui/notifier/task_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
      ),
      body: taskList.isEmpty
          ? const Center(
              child: Text(
                'タスクがありません',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return CheckboxListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Text(
                    '期限: ${DateFormat('yyyy/MM/dd').format(task.dueDate)}',
                  ),
                  value: task.isCompleted,
                  onChanged: (value) {
                    ref
                        .read(taskListProvider.notifier)
                        .toggleCompletion(task.id);
                  },
                  secondary: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _showDeleteConfirmDialog(context, ref, task),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => const AddTaskSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteConfirmDialog(
      BuildContext context, WidgetRef ref, Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('タスクの削除'),
          content: Text('「${task.title}」を削除しますか？'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                ref.read(taskListProvider.notifier).removeTask(task.id);
                Navigator.of(context).pop();
              },
              child: const Text('削除'),
            ),
          ],
        );
      },
    );
  }
}