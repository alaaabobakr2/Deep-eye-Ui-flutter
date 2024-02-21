import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradu_project/ui/home_screen/view/home_screen.dart';

import '../../currency_screen/view/home_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController=PageController(
    initialPage: 0,
    keepPage: true,
  );
  onItemTapped(int i){

    pageController.jumpToPage(i);
setState(() {

});


  }
  int currentIndex=0;
  void changeCurrentIndex(int value){
    currentIndex=value;
    setState(() {

    });

  }
  List<Widget> screens=[CameraScreen(),CurrencyScreen()];
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar:Container(
          color: Colors.black,
          height: height*.07,
          width: width*.05,
          child: CustomNavigationBar(
            isFloating: true,
            elevation: 0,
            iconSize: height*.04,
            borderRadius: const Radius.circular(50),
            selectedColor: const Color.fromARGB(255, 255, 255, 255),
            unSelectedColor: const Color.fromARGB(255, 129, 129, 129),
            backgroundColor: const Color.fromARGB(255, 22, 22, 22),
            strokeColor: Colors.black,
            onTap: onItemTapped,

            currentIndex: currentIndex,
            items: [
              CustomNavigationBarItem(
                  icon: Icon(Icons.camera_alt,
                    color: currentIndex==0?Colors.blue:Colors.white
                    ),
              ),
              CustomNavigationBarItem(
                icon: Icon(Icons.currency_pound,
                  color: currentIndex==1?Colors.blue:Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: PageView(
          children: screens,
          controller: pageController,
          onPageChanged: onItemTapped,
        )

      ),
    );
  }
}

