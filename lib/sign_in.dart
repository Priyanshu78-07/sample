import 'package:e_commercee/home_screen.dart';
import 'package:e_commercee/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SIGNIN extends StatefulWidget {
  const SIGNIN({super.key});

  @override
  State<SIGNIN> createState() => _SIGNINState();
}

class _SIGNINState extends State<SIGNIN> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Please Sign in to Continue",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "EMAIL",
                  prefixIcon: Icon(Icons.email_outlined),
                  labelStyle: TextStyle(fontSize: 12)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "PASSWORD",
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: TextButton(
                      onPressed: () {},
                      child: Text(
                        "FORGOT",
                        style: TextStyle(color: Colors.green),
                      )),
                  labelStyle: TextStyle(fontSize: 12)),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text)
                          .then((value) => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()))
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("LOGIN"),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 24.0,
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                  fontFamily: "STUDisplay", color: Colors.black, fontSize: 15),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SIGNUP()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontFamily: "STUDisplay",
                      color: Colors.green,
                      fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
