import 'package:e_commercee/home_screen.dart';
import 'package:e_commercee/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(
        title: "Shop All You Want!",
        description: "Select from a wide range of variety",
        image: 'assets/shopping.png'),
    WelcomeSlider(
        title: "Save Time, Order Online",
        description: "Convenience at your fingerprints",
        image: 'assets/clothes.png'),
    WelcomeSlider(
        title: "The Greatest Shopping Journey",
        description: "Select from all the Brands",
        image: 'assets/store.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: welcomeSlider.length,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = welcomeSlider[index];
                    return Column(
                      children: [
                        Image.asset(
                          item.image,
                          height: 350,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          item.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.description,
                          style: TextStyle(
                              color: Color.fromARGB(255, 94, 92, 92),
                              fontSize: 20),
                        )
                      ],
                    );
                  },
                ),
              ),
              Row(
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: _currentPage == index ? 30 : 10,
                      decoration: BoxDecoration(
                          color: _currentPage == index ? Colors.red : Colors.grey,
                          borderRadius: BorderRadius.circular(5)),
                    );
                  }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          if (_currentPage < welcomeSlider.length-1) {
            _pageController.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          }
        },
        child: _currentPage != welcomeSlider.length - 1
            ? Icon(Icons.arrow_forward)
            : Icon(Icons.done),
      ),
    );
  }
}

class WelcomeSlider {
  final String title;
  final String description;
  final String image;
  WelcomeSlider(
      {required this.title, required this.description, required this.image});
}
