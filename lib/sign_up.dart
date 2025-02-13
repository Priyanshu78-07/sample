import 'package:e_commercee/home_screen.dart';
import 'package:e_commercee/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SIGNUP extends StatefulWidget {
  const SIGNUP({super.key});

  @override
  State<SIGNUP> createState() => _SIGNUPState();
}

class _SIGNUPState extends State<SIGNUP> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              TextFields(
                  icon: Icon(Icons.person_2_outlined),
                  label: "Full Name",
                  controller: _nameController),
              SizedBox(
                height: 10,
              ),
              TextFields(
                  icon: Icon(Icons.email_outlined),
                  label: "EMIAL",
                  controller: _emailController),
              SizedBox(
                height: 10,
              ),
              TextFields(
                icon: Icon(Icons.lock_outlined),
                label: "PASSWORD",
                secureText: true,
                controller: _passwordController,
              ),
              SizedBox(
                height: 10,
              ),
              TextFields(
                  icon: Icon(Icons.lock_outlined),
                  label: "CONFIRM PASSWORD",
                  secureText: true,
                  controller: _confirmPasswodController),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen())));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("SIGN UP"),
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
      )),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: TextStyle(
                  fontFamily: "STUDisplay", color: Colors.black, fontSize: 15),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SIGNIN()));
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontFamily: "STUDisplay",
                    color: Colors.green,
                    fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final Icon icon;
  final String label;
  TextEditingController controller;
  bool secureText;
  TextFields(
      {super.key,
      required this.icon,
      required this.label,
      required this.controller,
      this.secureText = false});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      controller: controller,
      obscureText: secureText,
      style: TextStyle(color: Colors.black, fontFamily: "STUDisplay"),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: icon,
        labelText: label,
        labelStyle: TextStyle(fontSize: 12),
      ),
    ));
  }
}
