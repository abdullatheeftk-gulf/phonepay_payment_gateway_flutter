import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/cubit/build_state/home_build_state.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/cubit/home_cubit.dart';
import 'package:phonepay_payment_gateway_flutter/screens/home_screen/cubit/listener_state/home_listener_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _homeCubit;

  String? _result;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    _homeCubit.phonePeInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is HomeListenerState){
          if(state.appSnackBar!=null){
            final appSnackBar = state.appSnackBar;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(appSnackBar!.message),backgroundColor: appSnackBar.backGroundColor,),);
          }
        }
      },
      listenWhen: (prev,cur){
        if(prev is HomeListenerState){
          return true;
        }
        return false;
      },
      buildWhen: (prev,cur){
        if(prev is HomeBuildState){
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if(state is HomeBuildState){
          _result = state.result.toString();
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _homeCubit.startTransaction();
                  },
                  child: const Text("Pay with PhonePe"),
                ),

                const SizedBox(height: 24,),

                Text("$_result",style: const TextStyle(color: Colors.red,fontSize: 18),),
              ],
            ),
          ),
        );
      },
    );
  }
}
