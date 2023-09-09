import 'package:flutter/material.dart';

import 'Home_bage.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final emailcontroaler = TextEditingController();

  final passwordcontroaler = TextEditingController();

  final phonenumbercontrolaer = TextEditingController();

  final confirmpasswordcontroaler = TextEditingController();

  final loginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                      child: Text('Sign_Up',style: TextStyle(
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
                    controller: phonenumbercontrolaer,
                    validator: (value) {
                      if(value!.length<2){
                        return 'This letter is week ';
                      }else if(value.isEmpty){
                        return 'This field is required';
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 15,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText:'Enter your Phone number',
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
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: confirmpasswordcontroaler,
                    validator: (value) {
                      if(value!.length<2){
                        return 'This letter is week ';
                      }else if(value.isEmpty){
                        return 'This field is required';
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 15,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText:'confirm password',
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
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home_bage(),));
                        },
                        child: Text('Sign_in',style: TextStyle(
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
                    }else{
                      print('faild');
                    }
                    ///Navigator.push(context, MaterialPageRoute(builder: Splach_screen(),));
                    print(emailcontroaler.text);
                    print(passwordcontroaler.text);
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Text('Login',style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
