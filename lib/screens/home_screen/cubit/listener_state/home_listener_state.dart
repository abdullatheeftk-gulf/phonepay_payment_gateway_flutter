import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phonepay_payment_gateway_flutter/app_util/log_functions/app_snack_bar.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/cubit/home_cubit.dart';

part 'home_listener_state.freezed.dart';

@freezed
class HomeListenerState extends HomeState with _$HomeListenerState {

  factory HomeListenerState({
    String? errorMessage,
    @Default(null) AppSnackBar? appSnackBar,
  }) = _HomeListenerState;

}