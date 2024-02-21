import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradu_project/ui/home_screen/cubit/state.dart';

import '../../../main.dart';
import '../../description_screen/view/description_screen.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(InitialHomeState());
  static HomeCubit get(context)=>BlocProvider.of(context);
  late CameraController controller;

  late XFile file;
  AudioPlayer? audioPlayer;
  void playAudio() async {
    await audioPlayer?.play(AssetSource('camera mode.aac'));

  }



}