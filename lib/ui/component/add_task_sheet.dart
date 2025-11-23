import 'package:clean_architecture_todo/domain/value/priority.dart';
import 'package:clean_architecture_todo/ui/notifier/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddTaskSheet extends ConsumerStatefulWidget {
  const AddTaskSheet({super.key});

  @override
  ConsumerState<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends ConsumerState<AddTaskSheet> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  DateTime _dueDate = DateTime.now();
  Priority _priority = Priority.medium;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _dueDate) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(homeViewModelProvider.notifier).addTask(
            title: _title,
            description: _description,
            dueDate: _dueDate,
            priority: _priority,
          );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'タイトル'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'タイトルを入力してください';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: '詳細'),
                onSaved: (value) => _description = value ?? '',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '期限: ${DateFormat('yyyy/MM/dd').format(_dueDate)}',
                    ),
                  ),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('日付を選択'),
                  ),
                ],
              ),
              DropdownButtonFormField<Priority>(
                value: _priority,
                decoration: const InputDecoration(labelText: '優先度'),
                items: Priority.values.map((priority) {
                  return DropdownMenuItem(
                    value: priority,
                    child: Text(priority.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _priority = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('追加'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
