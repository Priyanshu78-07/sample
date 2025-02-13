import 'dart:async';
import "package:e_commercee/welcome_screen.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animationController.forward();
    Timer(const Duration(seconds: 7),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale:  Tween<double>(begin: 0,end: 1).animate(
                CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeOut),
              ),
              child: Image.asset('assets/logo.png',height: 150,),
            ),
            SizedBox(height: 50,),
            ScaleTransition(
              scale: Tween<double>(begin: 0,end: 1).animate(
                CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.linear),
              ),
              child: Text("Priyanshu's E-Commerce App",style: TextStyle(
                  fontSize: 26,fontWeight: FontWeight.bold,color: Colors.black
              ),),
            )
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 40,
        child: Text("Powered by Priyanshu",textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,fontSize: 18,fontStyle: FontStyle.italic),),
      ),
    );
  }
}
