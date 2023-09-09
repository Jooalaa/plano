import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plano/Home_bage.dart';

class Splach_screen extends StatefulWidget {
  Splach_screen({super.key});

  @override
  State<Splach_screen> createState() => _Splach_screenState();
}

class _Splach_screenState extends State<Splach_screen>with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3),);(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Home_bage()),
      );
    };
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/image 10.png'),fit: BoxFit.cover),
          //   gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Colors.black,
          //       Color(0xff4CE5B1),
          //     ],
          //   ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 200,),
              Center(child: Image.asset('assets/images/Ellipse 27.png')),
              const SizedBox(height: 55,),
              const Text('Welcome To Plano',style: TextStyle(
                color: Colors.white,
                fontSize: 20,

              ),)
            ],
          ),
        ),
      ),
    );
  }
}