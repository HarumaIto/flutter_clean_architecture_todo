import 'package:clean_architecture_todo/ui/component/task_list_item.dart';
import 'package:clean_architecture_todo/ui/notifier/task_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskListPage extends ConsumerWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(taskListViewModelProvider);

    return state.tasks.isEmpty
        ? const Center(child: Text('タスクがありません', style: TextStyle(fontSize: 18)))
        : ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return TaskListItem(task: task);
            },
          );
  }
}
