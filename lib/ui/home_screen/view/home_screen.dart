import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../main.dart';
import '../../description_screen/view/description_screen.dart';

class SceneApp extends StatefulWidget {
  /// Default Constructor
  const SceneApp({super.key});

  @override
  State<SceneApp> createState() => _SceneAppState();
}

class _SceneAppState extends State<SceneApp> {
  AudioPlayer? audioPlayer;
  FlutterTts flutterTts = FlutterTts();
  Future<void> speakText(String description) async {
    await flutterTts.setLanguage('ar-EG'); // Set the language (optional)
    await flutterTts.setPitch(.25); // Set the pitch (1.0 is default)
    await flutterTts.setSpeechRate(0.25); // Set the speech rate (1.0 is default)
    await flutterTts.speak(description); // Convert text to speech
  }
  void playAudio() async {
    await audioPlayer?.play(AssetSource('scene_mode.aac'));

  }
  late CameraController controller;
  loadCamera() async {
    if (!controller!.value.isInitialized) {
      return null;
    }
    if (controller!.value.isTakingPicture) {
      return null;
    }
    try {
      await controller!.setFlashMode(FlashMode.auto);
      XFile file = await controller!.takePicture();
      speakText('أهلا اللي تطبيق المكفوفين أهلا آلاء أهلا حسام أهلا علي أهلا مينا');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DescriptionScreen(
                file: file,
              )));

    } on CameraException catch (e) {
      debugPrint("Error occured while Taking picture $e");
      return null;
    }
  }


  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    playAudio();

    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    if (!controller.value.isInitialized) {
      return Container();
    }
    return
      Scaffold(
        body: InkWell(
          onTap: loadCamera,
          child: Container(
            height: height,
            child: CameraPreview(controller),
          ),
        ),
      );
  }
}