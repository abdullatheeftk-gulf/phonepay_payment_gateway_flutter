// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_listener_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeListenerState {
  String? get errorMessage => throw _privateConstructorUsedError;
  AppSnackBar? get appSnackBar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeListenerStateCopyWith<HomeListenerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeListenerStateCopyWith<$Res> {
  factory $HomeListenerStateCopyWith(
          HomeListenerState value, $Res Function(HomeListenerState) then) =
      _$HomeListenerStateCopyWithImpl<$Res, HomeListenerState>;
  @useResult
  $Res call({String? errorMessage, AppSnackBar? appSnackBar});

  $AppSnackBarCopyWith<$Res>? get appSnackBar;
}

/// @nodoc
class _$HomeListenerStateCopyWithImpl<$Res, $Val extends HomeListenerState>
    implements $HomeListenerStateCopyWith<$Res> {
  _$HomeListenerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? appSnackBar = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      appSnackBar: freezed == appSnackBar
          ? _value.appSnackBar
          : appSnackBar // ignore: cast_nullable_to_non_nullable
              as AppSnackBar?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppSnackBarCopyWith<$Res>? get appSnackBar {
    if (_value.appSnackBar == null) {
      return null;
    }

    return $AppSnackBarCopyWith<$Res>(_value.appSnackBar!, (value) {
      return _then(_value.copyWith(appSnackBar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeListenerStateImplCopyWith<$Res>
    implements $HomeListenerStateCopyWith<$Res> {
  factory _$$HomeListenerStateImplCopyWith(_$HomeListenerStateImpl value,
          $Res Function(_$HomeListenerStateImpl) then) =
      __$$HomeListenerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage, AppSnackBar? appSnackBar});

  @override
  $AppSnackBarCopyWith<$Res>? get appSnackBar;
}

/// @nodoc
class __$$HomeListenerStateImplCopyWithImpl<$Res>
    extends _$HomeListenerStateCopyWithImpl<$Res, _$HomeListenerStateImpl>
    implements _$$HomeListenerStateImplCopyWith<$Res> {
  __$$HomeListenerStateImplCopyWithImpl(_$HomeListenerStateImpl _value,
      $Res Function(_$HomeListenerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? appSnackBar = freezed,
  }) {
    return _then(_$HomeListenerStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      appSnackBar: freezed == appSnackBar
          ? _value.appSnackBar
          : appSnackBar // ignore: cast_nullable_to_non_nullable
              as AppSnackBar?,
    ));
  }
}

/// @nodoc

class _$HomeListenerStateImpl implements _HomeListenerState {
  _$HomeListenerStateImpl({this.errorMessage, this.appSnackBar = null});

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final AppSnackBar? appSnackBar;

  @override
  String toString() {
    return 'HomeListenerState(errorMessage: $errorMessage, appSnackBar: $appSnackBar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeListenerStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.appSnackBar, appSnackBar) ||
                other.appSnackBar == appSnackBar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, appSnackBar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeListenerStateImplCopyWith<_$HomeListenerStateImpl> get copyWith =>
      __$$HomeListenerStateImplCopyWithImpl<_$HomeListenerStateImpl>(
          this, _$identity);
}

abstract class _HomeListenerState implements HomeListenerState {
  factory _HomeListenerState(
      {final String? errorMessage,
      final AppSnackBar? appSnackBar}) = _$HomeListenerStateImpl;

  @override
  String? get errorMessage;
  @override
  AppSnackBar? get appSnackBar;
  @override
  @JsonKey(ignore: true)
  _$$HomeListenerStateImplCopyWith<_$HomeListenerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
