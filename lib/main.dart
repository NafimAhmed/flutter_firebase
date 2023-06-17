import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:careturor/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){

        return GetMaterialApp(
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
            primarySwatch: Colors.blueGrey,
          ),
          home: AnimatedSplashScreen(
            duration: 1000,
            splash: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 50.w,
                        height: 50.h,
                        child: Image.asset('assets/download.png',height: 70.h,width: 70.w,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            nextScreen: Home(),
            splashTransition: SplashTransition.fadeTransition,
            splashIconSize: double.maxFinite,
            backgroundColor:  Color(0xFFFFF8F8),
          ), //Home(),
        );
      },

    );


  }
}

