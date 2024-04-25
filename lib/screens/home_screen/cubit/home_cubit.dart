import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonepay_payment_gateway_flutter/app_util/log_functions/app_snack_bar.dart';
import 'package:phonepay_payment_gateway_flutter/repository/phonepe_payment.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/cubit/build_state/home_build_state.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/cubit/listener_state/home_listener_state.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PhonepePayment phonepePayment;
  HomeCubit({required this.phonepePayment}) : super(HomeStateInitial());

  void phonePeInit() async{
    emit(const HomeBuildState(showProgressbar: false));

    final result = await phonepePayment.phonePeInit();

    if(result is String){
        emit(HomeBuildState(errorMessage: result));
        emit(HomeListenerState(errorMessage: result));
        return;
    }

    emit(HomeBuildState(result: result));
  }

  void startTransaction() async{
    emit(const HomeBuildState(showProgressbar: false));

    final result = await phonepePayment.startTransaction();

    if(result is String){
       emit(HomeBuildState(errorMessage: result));
        emit(HomeListenerState(errorMessage: result, appSnackBar: AppSnackBar(message: result,backGroundColor: Colors.red)));
        return;
    }
    await phonepePayment.checPaymentStatus();
    emit( HomeBuildState(result: result));
    emit( HomeListenerState(appSnackBar: AppSnackBar(message: result.toString(),backGroundColor: Colors.green)));
  }
}
