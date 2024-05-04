import 'package:flutter/material.dart';
import 'package:gradu_project/ui/currency_screen/view/short_screen.dart';


class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CameraApp(),

        ],
      ),
    );
  }
}