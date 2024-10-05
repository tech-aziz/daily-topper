import 'package:daily_topper/app/config/style/color.dart';
import 'package:flutter/material.dart';
class ScreenOneView extends StatefulWidget {
  const ScreenOneView({super.key});

  @override
  State<ScreenOneView> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: const Text('Screen One'),
      ),
      body: const Center(
        child: Text('Screen One Body'),
      ),
    );
  }
}
