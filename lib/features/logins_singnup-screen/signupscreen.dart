

import 'package:chatapp/features/logins_singnup-screen/widget/customButton.dart';
import 'package:chatapp/features/logins_singnup-screen/widget/customtextformfield.dart';
import 'package:flutter/material.dart';

import '../../core/constant.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
   static String id="signUp Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
     body:  SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(16.0),
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
               child: Text("Sign Up",
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
             CustomButton(text: 'Sign Up', onTap: () { },),
             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 const Text("already have account ?",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 20,
                   ),
                 ),
                 TextButton(onPressed: (){
                   Navigator.pop(context);
                 }, child: const Text("Login ",
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
    );
  }
}
