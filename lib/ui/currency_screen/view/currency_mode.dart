import 'package:flutter/material.dart';
import 'package:gradu_project/ui/currency_screen/view/short_screen.dart';


class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {

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