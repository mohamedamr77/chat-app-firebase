import 'package:chatapp/features/logins_singnup-screen/signupscreen.dart';
import 'package:chatapp/features/logins_singnup-screen/widget/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/constant.dart';
import 'widget/customtextformfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  String? email;
  String? password;

  final GlobalKey<FormState> formKey = GlobalKey();

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.14),
                const Image(image: AssetImage("assets/images/scholar.png")),
                const Text(
                  "Scholar Chat",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pacifico",
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomTextFormField(
                  text: 'Email',
                  onChanged: (emailValue) {
                    email = emailValue;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CustomTextFormField(
                  text: 'Password',
                  onChanged: (passwordValue) {
                    password = passwordValue;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                CustomButton(
                  text: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        UserCredential userCredential = await auth.signInWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        );
                        showSnackBar(context, "Login successful");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context, "No user found for that email");
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context, "Wrong password provided for that user");
                        } else {
                          showSnackBar(context, "An error occurred. Please try again.");
                        }
                      }
                    } else {
                      showSnackBar(context, "Please enter both email and password.");
                    }
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                      child: const Text(
                        "Sign Up",
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
      ),
    );
  }
}
