import 'package:clean_architecture_todo/ui/navigator/navigator.dart';
import 'package:clean_architecture_todo/ui/page/settings_page.dart';
import 'package:clean_architecture_todo/ui/page/task_list_page.dart';
import 'package:clean_architecture_todo/ui/notifier/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const _pages = <Widget>[TaskListPage(), SettingsPage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final notifier = ref.read(homeViewModelProvider.notifier);
    final navigator = ref.read(navigatorProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Clean Architecture TODO')),
      body: _pages[state.pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.pageIndex,
        onTap: (index) => notifier.onPageChanged(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigator.pushToAddPage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
