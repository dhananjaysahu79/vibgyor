import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vibgyor/screens/loginscreen.dart';
import 'package:vibgyor/screens/splashscreen.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vibgyor",
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'GoogleSans',
        canvasColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.black),
        pageTransitionsTheme: PageTransitionsTheme(
        builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
      ),
     home: SplashScreen()
    );
  }
}

