import 'dart:async';
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gradu_project/ui/query/view/query.dart';
import 'package:gradu_project/ui/text_to_speech/text_to_speech_widget.dart';

class DescriptionScreen extends StatefulWidget {
  XFile file;
  DescriptionScreen({required this.file, super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  AudioPlayer? audioPlayer;
  void playAudio() async {
    await audioPlayer?.play(AssetSource('scene_mode.aac'));
  }

  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? description = 'Welcome to deap eye, '
        'Welcome alaa, '
        'Welcome hossam, '
        'Welcome mina, '
        'Welcome hend, '
        'Welcome mariam, '
        'Welcome youmna, '
        'Welcome alma, '
        'Welcome ahmed, '
        'Welcome hamdi, '
        'Welcome ali, '
        'Welcome rana, ';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Description',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            audioPlayer = AudioPlayer();
            playAudio();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(
              height: height * 0.3,
              picture,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            TextToSpeechWidget(
              lastDescription: description,
            ),
            Container(
              child: InkWell(
                child: Center(
                  child: Text(
                    'Query?',
                    style: TextStyle(
                        color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Query(),
                    ),
                  );
                },
              ),
              height: 150,
              width: width,
              decoration: BoxDecoration(
                  color: Color(0XFFD1C4E7),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }
}
