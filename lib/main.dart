import 'dart:collection';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gradu_project/ui/home_screen/view/home_screen.dart';
import 'package:gradu_project/ui/query/view/query.dart';
import 'package:gradu_project/ui/splash_screen/splash_screen.dart';



late List<CameraDescription> cameras;

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras =await availableCameras();


  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home':(context)=>  SceneApp(),
        'query':(context)=> Query(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
