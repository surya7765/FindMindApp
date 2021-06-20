import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:findmind/views/home.dart';
import 'package:slide_button/slide_button.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://lp-cms-production.imgix.net/2019-06/stock-photo-new-york-city-manhattan-100424161.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            bottom: 48.0,
            left: 10.0,
            right: 10.0,
            child: SwipeDetector(
              onSwipeLeft: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Home(),
                  ),
                );
              },
              child: SlideButton(
                height: 50,
                slidingChild: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(Icons.chevron_left),
                  ),
                ),
                borderRadius: 40.0,
                backgroundColor: Color(0x0000ffff).withOpacity(0.5),
                slidingBarColor: Color(0xffffff).withOpacity(0.7),
                slideDirection: SlideDirection.LEFT,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
