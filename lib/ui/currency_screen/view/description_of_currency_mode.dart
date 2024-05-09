import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


class DescriptionScreenofCurrency extends StatefulWidget {
  XFile file;
  DescriptionScreenofCurrency({required this.file, super.key});

  @override
  State<DescriptionScreenofCurrency> createState() => _DescriptionScreenofCurrencyState();
}

class _DescriptionScreenofCurrencyState extends State<DescriptionScreenofCurrency> {
  FlutterTts flutterTts = FlutterTts();
  Future<void> speakText(String description) async {
    await flutterTts.setLanguage('en-US'); // Set the language (optional)
    await flutterTts.setPitch(1.0); // Set the pitch (1.0 is default)
    await flutterTts.setSpeechRate(0.25); // Set the speech rate (1.0 is default)
    await flutterTts.speak(description); // Convert text to speech
  }
  AudioPlayer? audioPlayer;
  void playAudio() async {
    await audioPlayer?.play(AssetSource('currency_mode.aac'));
  }

  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String? description ='100 L.E';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Currency Recognition',
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
            size: height * .033,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.all(height*.014),
              child: Image.file(
                fit: BoxFit.cover,
                height: height*.30,
                width: width,
                picture,
              ),
            ),
          ),
          SizedBox(height: height*.05,),
          Padding(
            padding:  EdgeInsets.only(right: height*.02,left: height*.02,bottom: height*.01,top: height*0),
            child: Center(
              child: InkWell(
                onTap: (){
                  speakText('100 L.E');
                },
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height*.035,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}