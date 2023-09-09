import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plano/Login.dart';
import 'package:plano/Sign.dart';
import 'package:plano/mangers/auth_cubit.dart';

import 'splash_screen/splash_screen.dart';

class Home_bage extends StatefulWidget {

  const Home_bage({super.key});

  @override
  State<Home_bage> createState() => _Home_bageState();
}

class _Home_bageState extends State<Home_bage> {
  final emailcontroaler = TextEditingController();

  final passwordcontroaler = TextEditingController();

  final loginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is loginsucssesstate){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => home(),));
    }else if(state is loginerrorstate){
      SnackBar snackBar=SnackBar(content:Text('Login has Error'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }
  },
  builder: (context, state) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return Form(
      key: loginkey,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/image 10.png'),fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 300,),
                ///Image.asset('assets/images/image 14.png'),
                ///SizedBox(height: 80,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('Sign_in',style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: emailcontroaler,
                    validator: (value) {
                      if(value!.length<2){
                        return 'This email letter is week ';
                      }else if(value.isEmpty){
                        return 'This field is required';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 15,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText:'Enter your name or email',
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: passwordcontroaler,
                    validator: (value) {
                      if(value!.length<2){
                        return 'This letter is week';
                      }else if(value.isEmpty){
                        return 'This field is required';
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 15,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText:'Enter your password',
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text('Dont have email?',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),),
                      SizedBox(width: 80,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Sign_up(),));
                        },
                        child: Text('Sign_Up',style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap:() {
                    if(loginkey.currentState!.validate()){
                      print('Succses');
                      cubit.login(email: emailcontroaler.text, password: passwordcontroaler.text);
                    }else{
                      print('faild');
                    }
                    ///Navigator.push(context, MaterialPageRoute(builder: Splach_screen(),));
                    print(emailcontroaler.text);
                    print(passwordcontroaler.text);
                  },
                      child:state is loginloadingstate?
                      CircularProgressIndicator(color: Colors.white,):
                      Text('Login',style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),),
                ),
            ],
            ),
        ),
      ),
    ),
    );
  },
);
  }
}
