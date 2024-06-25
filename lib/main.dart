import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'features/logins_singnup-screen/loginscreen.dart';
import 'features/logins_singnup-screen/signupscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignUpScreen.id:(context) =>  SignUpScreen(),
        "LoginScreen" :(context) => const LoginScreen(),
      },
      initialRoute: "LoginScreen",
      debugShowCheckedModeBanner: false,
    );
  }

}