import 'package:flutter/material.dart';
import 'package:gradu_project/ui/home_screen/view/home_screen.dart';
import '../../currency_screen/view/currency_mode.dart';


class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final bottomNavigationBarItems=[
    const BottomNavigationBarItem(icon: Icon(Icons.camera_alt),label: 'Scene Mode',),
    const BottomNavigationBarItem(icon: Icon(Icons.currency_pound),label: 'Currency Mode'),


  ];
  PageController pageController=PageController(
    initialPage: 0,

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
  List<Widget> screens=[ SceneApp(), CurrencyScreen(),];
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (newIndex){
              pageController.animateToPage(newIndex, duration: const Duration(milliseconds:500), curve: Curves.ease);

            },
            currentIndex: currentIndex,
            items: bottomNavigationBarItems,type: BottomNavigationBarType.fixed,
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (newIndex){
              setState(() {
                currentIndex=newIndex;
              });
            },
            children: screens,

          )

      ),
    );
  }
}