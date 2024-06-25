import 'package:chatapp/features/logins_singnup-screen/widget/customButton.dart';
import 'package:chatapp/features/logins_singnup-screen/widget/customtextformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constant.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static String id="signUp Screen";
  String? email;
  String? password;

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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              CustomTextFormField(
                text: 'Email',
                onChanged: (emailData) {
                  email = emailData;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              CustomTextFormField(
                text: 'Password',
                onChanged: (passwordData) {
                  password = passwordData;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              CustomButton(
                text: 'Sign Up',
                onTap: () async {
                  if (email != null && password != null) {
                    try {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      UserCredential user = await auth.createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Regestrioin Success"))
                      );
                      print(user.user!.email!);
                    } on FirebaseAuthException catch (e) {
                      String message;
                      switch (e.code) {
                        case 'email-already-in-use':
                          message = 'The email address is already in use by another account.';
                          break;
                        case 'invalid-email':
                          message = 'The email address is not valid.';
                          break;
                        case 'operation-not-allowed':
                          message = 'Email/password accounts are not enabled.';
                          break;
                        case 'weak-password':
                          message = 'The password is too weak.';
                          break;
                        default:
                          message = 'An unknown error occurred.';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            message,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'An error occurred. Please try again.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please enter both email and password.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
