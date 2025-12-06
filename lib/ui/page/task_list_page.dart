import 'package:clean_architecture_todo/ui/notifier/task_list_view_model.dart';
import 'package:clean_architecture_todo/ui/state/task_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(taskListViewModelProvider);

    return state.tasks.isEmpty
        ? const Center(
            child: Text(
              'タスクがありません',
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return CheckboxListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  '期限: ${task.dueDate}',
                ),
                value: task.isCompleted,
                onChanged: (value) {
                  ref.read(taskListViewModelProvider.notifier).toggleCompletion(task.id);
                },
                secondary: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _showDeleteConfirmDialog(context, ref, task),
                ),
              );
            },
          );
  }

  void _showDeleteConfirmDialog(BuildContext context, WidgetRef ref, TaskUiModel task) {
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
                ref.read(taskListViewModelProvider.notifier).removeTask(task.id);
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
