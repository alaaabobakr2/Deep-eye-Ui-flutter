import 'dart:async';
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
  AudioPlayer? audioPlayer2;
  FlutterTts flutterTts = FlutterTts();

  void playAudio() async {
    await audioPlayer?.play(AssetSource('query.aac'));
  }
  void playAudio2() async {
    await audioPlayer2?.play(AssetSource('scene_mode.aac'));
  }
  Future<void> speakText(String description) async {
    await flutterTts.setLanguage('en-US'); // Set the language (optional)
    await flutterTts.setPitch(1.0); // Set the pitch (1.0 is default)
    await flutterTts.setSpeechRate(0.25); // Set the speech rate (1.0 is default)
    await flutterTts.speak(description); // Convert text to speech
  }


  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? description = 'this is a labtob in the table';

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
            SizedBox(height: height*.02,),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: height*.02),
                    child: InkWell(
                      onTap: (){
                        speakText(description);
                      },
                      child: Text(
                        description,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TextToSpeechWidget(
            //   lastDescription: description,
            // ),
            Container(
              height: 150,
              width: width,
              decoration: BoxDecoration(
                  color: Color(0XFFD1C4E7),
                  borderRadius: BorderRadius.circular(20)),
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
            ),
          ],
        ),
      ),
    );
  }
}
