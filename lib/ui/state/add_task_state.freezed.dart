// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddTaskState {

 DateTime get dueDate; Priority get priority;
/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTaskStateCopyWith<AddTaskState> get copyWith => _$AddTaskStateCopyWithImpl<AddTaskState>(this as AddTaskState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskState&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.priority, priority) || other.priority == priority));
}


@override
int get hashCode => Object.hash(runtimeType,dueDate,priority);

@override
String toString() {
  return 'AddTaskState(dueDate: $dueDate, priority: $priority)';
}


}

/// @nodoc
abstract mixin class $AddTaskStateCopyWith<$Res>  {
  factory $AddTaskStateCopyWith(AddTaskState value, $Res Function(AddTaskState) _then) = _$AddTaskStateCopyWithImpl;
@useResult
$Res call({
 DateTime dueDate, Priority priority
});




}
/// @nodoc
class _$AddTaskStateCopyWithImpl<$Res>
    implements $AddTaskStateCopyWith<$Res> {
  _$AddTaskStateCopyWithImpl(this._self, this._then);

  final AddTaskState _self;
  final $Res Function(AddTaskState) _then;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dueDate = null,Object? priority = null,}) {
  return _then(_self.copyWith(
dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as Priority,
  ));
}

}


/// Adds pattern-matching-related methods to [AddTaskState].
extension AddTaskStatePatterns on AddTaskState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddTaskState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTaskState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddTaskState value)  $default,){
final _that = this;
switch (_that) {
case _AddTaskState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddTaskState value)?  $default,){
final _that = this;
switch (_that) {
case _AddTaskState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime dueDate,  Priority priority)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTaskState() when $default != null:
return $default(_that.dueDate,_that.priority);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime dueDate,  Priority priority)  $default,) {final _that = this;
switch (_that) {
case _AddTaskState():
return $default(_that.dueDate,_that.priority);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime dueDate,  Priority priority)?  $default,) {final _that = this;
switch (_that) {
case _AddTaskState() when $default != null:
return $default(_that.dueDate,_that.priority);case _:
  return null;

}
}

}

/// @nodoc


class _AddTaskState implements AddTaskState {
  const _AddTaskState({required this.dueDate, this.priority = Priority.none});
  

@override final  DateTime dueDate;
@override@JsonKey() final  Priority priority;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTaskStateCopyWith<_AddTaskState> get copyWith => __$AddTaskStateCopyWithImpl<_AddTaskState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTaskState&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.priority, priority) || other.priority == priority));
}


@override
int get hashCode => Object.hash(runtimeType,dueDate,priority);

@override
String toString() {
  return 'AddTaskState(dueDate: $dueDate, priority: $priority)';
}


}

/// @nodoc
abstract mixin class _$AddTaskStateCopyWith<$Res> implements $AddTaskStateCopyWith<$Res> {
  factory _$AddTaskStateCopyWith(_AddTaskState value, $Res Function(_AddTaskState) _then) = __$AddTaskStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime dueDate, Priority priority
});




}
/// @nodoc
class __$AddTaskStateCopyWithImpl<$Res>
    implements _$AddTaskStateCopyWith<$Res> {
  __$AddTaskStateCopyWithImpl(this._self, this._then);

  final _AddTaskState _self;
  final $Res Function(_AddTaskState) _then;

/// Create a copy of AddTaskState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dueDate = null,Object? priority = null,}) {
  return _then(_AddTaskState(
dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as Priority,
  ));
}


}

// dart format on
