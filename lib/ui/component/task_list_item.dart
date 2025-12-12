import 'package:clean_architecture_todo/ui/navigator/navigator.dart';
import 'package:clean_architecture_todo/ui/notifier/task_list_view_model.dart';
import 'package:clean_architecture_todo/ui/state/task_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListItem extends ConsumerWidget {
  const TaskListItem({
    super.key,
    required this.task,
  });

  final TaskUiModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CheckboxListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        '期限: ${task.dueDate}',
        style: TextStyle(
          color: task.isOverdue ? Colors.red : null,
        ),
      ),
      value: task.isCompleted,
      onChanged: (value) {
        ref.read(taskListViewModelProvider.notifier).toggleCompletion(task.id);
      },
      secondary: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          ref.read(navigatorProvider).showDeleteConfirmDialog(
                title: 'タスクの削除',
                content: '「${task.title}」を削除しますか？',
                onConfirm: () {
                  ref.read(taskListViewModelProvider.notifier).removeTask(task.id);
                },
              );
        },
      ),
    );
  }
}
