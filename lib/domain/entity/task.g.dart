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
  createdAt: const TimestampConverter().fromJson(json['createdAt'] as String),
  dueDate: const TimestampConverter().fromJson(json['dueDate'] as String),
  priority: $enumDecode(_$PriorityEnumMap, json['priority']),
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'isCompleted': instance.isCompleted,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
  'dueDate': const TimestampConverter().toJson(instance.dueDate),
  'priority': _$PriorityEnumMap[instance.priority]!,
};

const _$PriorityEnumMap = {
  Priority.low: 'low',
  Priority.medium: 'medium',
  Priority.high: 'high',
};
