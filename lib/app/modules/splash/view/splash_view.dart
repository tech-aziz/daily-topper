import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_topper/app/modules/home/view/home_view.dart';
import 'package:flutter/material.dart';
import '../../../config/components/text_style.dart';
import '../../../config/style/app_string.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff4065F0), // First color
              Color(0xff9A75FD), // Second color
            ],
            begin: Alignment.bottomCenter, // Start from the top left
            end: Alignment.topCenter, // End at the bottom right
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text(AppString.appName, style: textStyle(
                  fontSize: 30, color: const Color(0xffFBFBFB))
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AutoSizeText(
                      AppString.companyTag,
                      style: textStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
