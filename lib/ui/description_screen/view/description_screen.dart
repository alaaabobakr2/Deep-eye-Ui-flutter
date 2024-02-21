import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';



class DescriptionScreen extends StatefulWidget {
  XFile file;
  DescriptionScreen({required this.file, super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {


  // void onItemTapped(int i){
  //   setState(() {
  //     pageController.jumpToPage(i);
  //   });
  // }
  AudioPlayer? audioPlayer;
  void playAudio() async {
    await audioPlayer?.play(AssetSource('camera mode.aac'));
  }

  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: curentIndex,
      //   onTap: (index){
      //     onPageChanged(index);
      //   }, items: const [
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.home),
      //     label: 'Screen 1',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.business),
      //     label: 'Screen 2',
      //   ),
      // ],
      // ),
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          'Description',
          style: TextStyle(
            fontSize: height * .02,
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
            size: height * .03,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height*.2,),
            child: Padding(
              padding:  EdgeInsets.only(left: height*.066),
              child: Image.file(
                height: height*.60,
                  picture,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
