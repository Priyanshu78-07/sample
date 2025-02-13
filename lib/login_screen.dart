import 'package:e_commercee/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_in.dart';
import 'sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logo2.jpg'), fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 300, 5, 20),
              ),
              Image.asset(
                'assets/logo.png',
                height: 175,
              ),
              SizedBox(
                height: 100,
              ),
              Button(
                  text: 'SIGN UP',
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SIGNUP()));
                  }),
              SizedBox(
                height: 25,
              ),
              Button(
                  text: 'SIGN IN',
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SIGNIN()));
                  }),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30,right: 30),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.yellow, fontSize: 26,fontWeight: FontWeight.w400),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}

class Button extends StatefulWidget {
  String text;
  final void Function() onPressed;
  Button({super.key, required this.text, required this.onPressed});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
          child: Text(
            widget.text,
            style:
            TextStyle(color: Color.fromARGB(255, 94, 92, 92), fontSize: 22),
          )),
    );
  }
}
