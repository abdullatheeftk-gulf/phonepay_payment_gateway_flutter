
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/cubit/home_cubit.dart';

part 'home_build_state.freezed.dart';

@freezed
class HomeBuildState<T> extends HomeState with _$HomeBuildState {

  const factory HomeBuildState({
    @Default(false) bool showProgressbar,
    @Default(null) T? result,
    @Default(null) String? errorMessage,

  }) = _HomeBuildState;
}