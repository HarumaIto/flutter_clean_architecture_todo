// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  isCompleted: json['isCompleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  dueDate: DateTime.parse(json['dueDate'] as String),
  priority: $enumDecode(_$PriorityEnumMap, json['priority']),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'isCompleted': instance.isCompleted,
  'createdAt': instance.createdAt.toIso8601String(),
  'dueDate': instance.dueDate.toIso8601String(),
  'priority': _$PriorityEnumMap[instance.priority]!,
};

const _$PriorityEnumMap = {
  Priority.low: 'low',
  Priority.medium: 'medium',
  Priority.high: 'high',
};
