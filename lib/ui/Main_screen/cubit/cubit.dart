
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradu_project/ui/Main_screen/cubit/state.dart';
import '../../currency_screen/view/home_screen.dart';
import '../../home_screen/view/home_screen.dart';


class MainCubit extends Cubit <MainState>{
  MainCubit():super(InitialState());
  static MainCubit get(context)=>BlocProvider.of(context);
   int currentIndex = 0 ;
  PageController pageController=PageController(

  );
  List<Widget> screens=[
    const CameraScreen(),
    const CurrencyScreen(),
  ];
  void changeCurrentIndex(int value){
    currentIndex=value;


  }
   onPageChanged(int index){
    currentIndex=index;

  }
   onItemTapped(int i){

      pageController.jumpToPage(i);



  }

}