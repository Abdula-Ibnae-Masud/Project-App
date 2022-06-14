import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_dart_flutter/widgets/bottom_widget.dart';
import 'package:getx_dart_flutter/widgets/language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: const Locale("bn", "BN"),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        // For a "Splash" page, no loading.
        splash: const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.black,
          backgroundImage: AssetImage('assets/images/dbsl.png'),
        ),
        duration: 3000,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.blue,
        nextScreen: const BottomWidget(),
      ),
    );
  }
}
