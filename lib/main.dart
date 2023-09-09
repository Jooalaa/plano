import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plano/mangers/auth_cubit.dart';
import 'Home_bage.dart';
import 'splash_screen/splash_screen.dart';

void main() {
  runApp(BeyondthePlanets());
}

class BeyondthePlanets extends StatelessWidget {
  const BeyondthePlanets({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AuthCubit(),),
    ], child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plano',
      home: Home_bage(),
    ));
  }
}
