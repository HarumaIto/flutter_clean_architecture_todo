import 'package:clean_architecture_todo/ui/page/add_task_page.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigator.g.dart';

@riverpod
Navigator navigator(Ref ref) {
  return Navigator();
}

class Navigator {
  final key = GlobalKey<NavigatorState>();

  BuildContext get _context => key.currentContext!;

  Future<void> showDeleteConfirmDialog({
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) async {
    return showDialog(
      context: _context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => key.currentState!.pop(),
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
                key.currentState!.pop();
              },
              child: const Text('削除'),
            ),
          ],
        );
      },
    );
  }

  Future<void> pushToAddPage() async {
    await key.currentState!.push(
      MaterialPageRoute(builder: (context) => const AddTaskPage()),
    );
  }
}
