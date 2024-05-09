import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../home_screen/view/home_screen.dart';

class Query extends StatelessWidget {
  const Query({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AudioPlayer? audioPlayer;
  void playAudio() async {
    await audioPlayer?.play(AssetSource('ask_your_question.aac'));

  }
  AudioPlayer? audioPlayer3;
  void playAudio3() async {
    await audioPlayer?.play(AssetSource('query.aac'));

  }
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String words ='hello world';
  String _lastWords = '';
  FlutterTts flutterTts = FlutterTts();
  Future<void> speakText(String description) async {
    await flutterTts.setLanguage('en-US'); // Set the language (optional)
    await flutterTts.setPitch(.25); // Set the pitch (1.0 is default)
    await flutterTts.setSpeechRate(0.25); // Set the speech rate (1.0 is default)
    await flutterTts.speak(description); // Convert text to speech
  }
  AudioPlayer? audioPlayer2;
  void playAudio2() async {
    await audioPlayer2?.play(AssetSource('scene_mode.aac'));

  }



  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    playAudio3();
    _initSpeech();

  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    await speakText(words);
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Query' ,
          style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SceneApp()));
          playAudio2();
          playAudio3();
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
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Recognized words:',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(_lastWords,style: TextStyle(
                    fontSize: 30,
                  ),)
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  // If listening is active show the recognized words
                  _speechToText.isListening
                      ? '$_lastWords'
                  // If listening isn't active but could be tell the user
                  // how to start it, otherwise indicate that speech
                  // recognition is not yet ready or not supported on
                  // the target device
                      : _speechEnabled
                      ? 'Tap the microphone to start listening...'
                      : 'Speech not available',
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: Container(
        height: 400,
        width: width,
        child: FloatingActionButton(
          onPressed:
          // If not yet listening for speech start, otherwise stop
          _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: 'Listen',
          child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
