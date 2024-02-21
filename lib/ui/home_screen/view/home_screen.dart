import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradu_project/main.dart';
import 'package:gradu_project/ui/home_screen/cubit/cubit.dart';
import '../../description_screen/view/description_screen.dart';
import '../cubit/state.dart';


class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  void playAudio() async {
    await audioPlayer?.play(AssetSource('camera mode.aac'));

  }
  AudioPlayer? audioPlayer;
  late CameraController controller;
  late Future<void> initializeControllerFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
    playAudio();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if(!mounted){
        return;
      }
      setState(() {

      });
    }).catchError((Object e)
        {
          if(e is CameraException)
            switch(e.code){
              case 'CameraAccessDenied':
                print("access with denied");
                break;
              default:
                print(e.description);

            }
        }
    );
  }
  @override
  void dispose() {
    controller.dispose();
    audioPlayer?.dispose();
    super.dispose();
  }
  late XFile file;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeCubit()..playAudio(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            body: Stack(
              children: [
                InkWell(
                  onTap: () async {
                    if(!controller.value.isInitialized){
                      return null;
                    }
                    if(controller.value.isTakingPicture){
                      return null;
                    }
                    try{
                      await controller.setFlashMode(FlashMode.auto);
                      XFile file= await controller.takePicture();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionScreen(file: file,)));
                    } on CameraException catch(e){
                      debugPrint("Error occured while Taking picture $e");
                      return null;

                    }
                  },
                  child: Container(
                    height: double.infinity,
                    child: CameraPreview(controller),

                  ),
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}
