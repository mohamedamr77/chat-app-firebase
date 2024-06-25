
import 'package:chatapp/features/logins_singnup-screen/signupscreen.dart';
import 'package:chatapp/features/logins_singnup-screen/widget/customButton.dart';
import 'package:flutter/material.dart';

import '../../core/constant.dart';
import 'widget/customtextformfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 SizedBox(height: MediaQuery.of(context).size.height*0.14,),
                const Image(image: AssetImage("assets/images/scholar.png")),
                const Text("Scholar Chat",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pacifico",
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                const  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                                ),
                  ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                const CustomTextFormField(text: 'Email',),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                const CustomTextFormField(text: 'Password',),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                CustomButton(text: 'Login', onTap: () { },),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("don't have an account ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(onPressed: (){
                      //MaterialPageRoute(builder: (context) => const SignUpScreen())
                      Navigator.pushNamed(context, SignUpScreen.id);
                    }, child: const Text("Sign Up",
                    style: TextStyle(
                      color: Colors.white
                    ),

                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
