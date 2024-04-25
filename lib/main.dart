import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonepay_payment_gateway_flutter/repository/phonepe_payment.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/cubit/home_cubit.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/home_screen.dart';

final Dio dio = Dio(BaseOptions(baseUrl: "https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/status/"));
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PhonepePayment(),
      child: BlocProvider(
        create: (context) => HomeCubit(phonepePayment: context.read<PhonepePayment>()),
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
