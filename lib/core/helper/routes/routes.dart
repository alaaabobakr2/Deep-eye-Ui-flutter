import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradu_project/ui/home_screen/view/home_screen.dart';

class Routes{
  static const mainRoute="/home";
}
class routeGenerator{
  static Route <dynamic>? getRoutes(RouteSettings settings){
   switch(settings.name){
     case Routes.mainRoute:
       return MaterialPageRoute(builder: (_)=>const CameraScreen());

   }

  }
}