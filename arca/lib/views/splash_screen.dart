import 'dart:async';

import 'package:arca/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:arca/utils/colors.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final _imageRows = [
    [
      'assets/images/lg-logo.png',
      'assets/images/gsoc.png',
      'assets/images/LogoLGEU.png',
      'assets/images/0-logo-liquidgalaxylab.png',
    ],
    [
      'assets/images/gdg-lleida.png',
      'assets/images/wtm-lleida.png',
      'assets/images/lab-tic.png',
      'assets/images/parc-agrobiotech.png',
    ],
    [
      'assets/images/EPS-logonou-transpng.png',
      'assets/images/flutter.png',
      'assets/images/Android_robot.svg.png'
    ]
  ];

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: ThemeColors.logo,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 16),
                child: Image.asset('assets/images/ARCA.png'),
              ),
              ..._imageRows
                  .map(
                    (images) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: images
                            .map(
                              (img) => Container(
                                alignment: Alignment.center,
                                width: screenWidth / (images.length + 1),
                                height: screenHeight / 10,
                                child: Image.asset(img),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
