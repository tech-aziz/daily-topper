import 'package:flutter/material.dart';
class ScreenTwoView extends StatefulWidget {
  const ScreenTwoView({super.key});

  @override
  State<ScreenTwoView> createState() => _ScreenTwoViewState();
}

class _ScreenTwoViewState extends State<ScreenTwoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: const Center(
        child: Text('Screen Two Body'),
      ),
    );
  }
}
