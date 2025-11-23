import 'package:clean_architecture_todo/ui/component/add_task_sheet.dart';
import 'package:clean_architecture_todo/ui/state/home_state.dart';
import 'package:clean_architecture_todo/ui/notifier/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
      ),
      body: homeState.tasks.isEmpty
          ? const Center(
              child: Text(
                'タスクがありません',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: homeState.tasks.length,
              itemBuilder: (context, index) {
                final task = homeState.tasks[index];
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
                    '期限: ${task.dueDate}',
                  ),
                  value: task.isCompleted,
                  onChanged: (value) {
                    ref
                        .read(homeViewModelProvider.notifier)
                        .toggleCompletion(task.id);
                  },
                  secondary: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        _showDeleteConfirmDialog(context, ref, task),
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
      BuildContext context, WidgetRef ref, TaskUiModel task) {
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
                ref.read(homeViewModelProvider.notifier).removeTask(task.id);
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