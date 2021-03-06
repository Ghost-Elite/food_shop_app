import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer(){
    Timer(const Duration(seconds: 5) , () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Authentification()));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/images/splash.jpg'),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child:  Text('Sel Food Online',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black54,
                  fontSize: 40,
                  fontFamily: 'Signatra',
                  letterSpacing: 3
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
