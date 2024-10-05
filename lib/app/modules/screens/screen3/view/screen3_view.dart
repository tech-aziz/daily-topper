import 'package:flutter/material.dart';
class ScreenThreeView extends StatefulWidget {
  const ScreenThreeView({super.key});

  @override
  State<ScreenThreeView> createState() => _ScreenThreeViewState();
}

class _ScreenThreeViewState extends State<ScreenThreeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Three'),
      ),
      body: const Center(
        child: Text('Screen Three Body'),
      ),
    );
  }
}
