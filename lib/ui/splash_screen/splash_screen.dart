import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gradu_project/ui/home_screen/view/home_screen.dart';

import '../Main_screen/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AudioPlayer? audioPlayer;
  Timer? timer;
  void playAudio() async {
    await audioPlayer?.play(AssetSource('welcome.aac'));



  }
  startDelay(){
    timer=Timer(const Duration(seconds: 5), goNext);
  }
  goNext(){
    Navigator.pushReplacementNamed(context, 'home');
  }
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    playAudio();
    //startDelay();
  }
  @override
  void dispose() {
    audioPlayer?.dispose();
    timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSplashScreen(
        splash: 'assets/man1.jpg',
        nextScreen: const MainScreen(),
        splashTransition:SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        animationDuration: const Duration(seconds: 1),



      ),

    );
  }
}

