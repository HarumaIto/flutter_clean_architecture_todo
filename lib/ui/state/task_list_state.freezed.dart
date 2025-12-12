// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskListState {

 List<TaskUiModel> get tasks;
/// Create a copy of TaskListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskListStateCopyWith<TaskListState> get copyWith => _$TaskListStateCopyWithImpl<TaskListState>(this as TaskListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListState&&const DeepCollectionEquality().equals(other.tasks, tasks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tasks));

@override
String toString() {
  return 'TaskListState(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $TaskListStateCopyWith<$Res>  {
  factory $TaskListStateCopyWith(TaskListState value, $Res Function(TaskListState) _then) = _$TaskListStateCopyWithImpl;
@useResult
$Res call({
 List<TaskUiModel> tasks
});




}
/// @nodoc
class _$TaskListStateCopyWithImpl<$Res>
    implements $TaskListStateCopyWith<$Res> {
  _$TaskListStateCopyWithImpl(this._self, this._then);

  final TaskListState _self;
  final $Res Function(TaskListState) _then;

/// Create a copy of TaskListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tasks = null,}) {
  return _then(_self.copyWith(
tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskUiModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskListState].
extension TaskListStatePatterns on TaskListState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskListState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskListState value)  $default,){
final _that = this;
switch (_that) {
case _TaskListState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskListState value)?  $default,){
final _that = this;
switch (_that) {
case _TaskListState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TaskUiModel> tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskListState() when $default != null:
return $default(_that.tasks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TaskUiModel> tasks)  $default,) {final _that = this;
switch (_that) {
case _TaskListState():
return $default(_that.tasks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TaskUiModel> tasks)?  $default,) {final _that = this;
switch (_that) {
case _TaskListState() when $default != null:
return $default(_that.tasks);case _:
  return null;

}
}

}

/// @nodoc


class _TaskListState implements TaskListState {
  const _TaskListState({final  List<TaskUiModel> tasks = const []}): _tasks = tasks;
  

 final  List<TaskUiModel> _tasks;
@override@JsonKey() List<TaskUiModel> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of TaskListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskListStateCopyWith<_TaskListState> get copyWith => __$TaskListStateCopyWithImpl<_TaskListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskListState&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'TaskListState(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$TaskListStateCopyWith<$Res> implements $TaskListStateCopyWith<$Res> {
  factory _$TaskListStateCopyWith(_TaskListState value, $Res Function(_TaskListState) _then) = __$TaskListStateCopyWithImpl;
@override @useResult
$Res call({
 List<TaskUiModel> tasks
});




}
/// @nodoc
class __$TaskListStateCopyWithImpl<$Res>
    implements _$TaskListStateCopyWith<$Res> {
  __$TaskListStateCopyWithImpl(this._self, this._then);

  final _TaskListState _self;
  final $Res Function(_TaskListState) _then;

/// Create a copy of TaskListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(_TaskListState(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskUiModel>,
  ));
}


}

/// @nodoc
mixin _$TaskUiModel {

 String get id; String get title; String get description; bool get isCompleted; String get dueDate; String get priority; bool get isOverdue;
/// Create a copy of TaskUiModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskUiModelCopyWith<TaskUiModel> get copyWith => _$TaskUiModelCopyWithImpl<TaskUiModel>(this as TaskUiModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,isCompleted,dueDate,priority,isOverdue);

@override
String toString() {
  return 'TaskUiModel(id: $id, title: $title, description: $description, isCompleted: $isCompleted, dueDate: $dueDate, priority: $priority, isOverdue: $isOverdue)';
}


}

/// @nodoc
abstract mixin class $TaskUiModelCopyWith<$Res>  {
  factory $TaskUiModelCopyWith(TaskUiModel value, $Res Function(TaskUiModel) _then) = _$TaskUiModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, bool isCompleted, String dueDate, String priority, bool isOverdue
});




}
/// @nodoc
class _$TaskUiModelCopyWithImpl<$Res>
    implements $TaskUiModelCopyWith<$Res> {
  _$TaskUiModelCopyWithImpl(this._self, this._then);

  final TaskUiModel _self;
  final $Res Function(TaskUiModel) _then;

/// Create a copy of TaskUiModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? isCompleted = null,Object? dueDate = null,Object? priority = null,Object? isOverdue = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskUiModel].
extension TaskUiModelPatterns on TaskUiModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskUiModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskUiModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskUiModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskUiModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskUiModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskUiModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  bool isCompleted,  String dueDate,  String priority,  bool isOverdue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskUiModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.dueDate,_that.priority,_that.isOverdue);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  bool isCompleted,  String dueDate,  String priority,  bool isOverdue)  $default,) {final _that = this;
switch (_that) {
case _TaskUiModel():
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.dueDate,_that.priority,_that.isOverdue);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  bool isCompleted,  String dueDate,  String priority,  bool isOverdue)?  $default,) {final _that = this;
switch (_that) {
case _TaskUiModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.dueDate,_that.priority,_that.isOverdue);case _:
  return null;

}
}

}

/// @nodoc


class _TaskUiModel implements TaskUiModel {
  const _TaskUiModel({required this.id, required this.title, required this.description, required this.isCompleted, required this.dueDate, required this.priority, required this.isOverdue});
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  bool isCompleted;
@override final  String dueDate;
@override final  String priority;
@override final  bool isOverdue;

/// Create a copy of TaskUiModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskUiModelCopyWith<_TaskUiModel> get copyWith => __$TaskUiModelCopyWithImpl<_TaskUiModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskUiModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,isCompleted,dueDate,priority,isOverdue);

@override
String toString() {
  return 'TaskUiModel(id: $id, title: $title, description: $description, isCompleted: $isCompleted, dueDate: $dueDate, priority: $priority, isOverdue: $isOverdue)';
}


}

/// @nodoc
abstract mixin class _$TaskUiModelCopyWith<$Res> implements $TaskUiModelCopyWith<$Res> {
  factory _$TaskUiModelCopyWith(_TaskUiModel value, $Res Function(_TaskUiModel) _then) = __$TaskUiModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, bool isCompleted, String dueDate, String priority, bool isOverdue
});




}
/// @nodoc
class __$TaskUiModelCopyWithImpl<$Res>
    implements _$TaskUiModelCopyWith<$Res> {
  __$TaskUiModelCopyWithImpl(this._self, this._then);

  final _TaskUiModel _self;
  final $Res Function(_TaskUiModel) _then;

/// Create a copy of TaskUiModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? isCompleted = null,Object? dueDate = null,Object? priority = null,Object? isOverdue = null,}) {
  return _then(_TaskUiModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
