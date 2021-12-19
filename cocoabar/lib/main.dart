import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CocoaBar',
      theme: ThemeData(primaryColor: Colors.white),
      home: const MyHomePage(title: 'CocoaBar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var whatsappURl_android = "whatsapp://send?phone=01115060678&text=hello";
  var whatappURL_ios = "https://wa.me/01115060678?text=${Uri.parse("hello")}";

  openwhatsapp() async {
    var whatsapp = "+201212903697";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=I want to order";
    var whatappURL_ios =
        "https://wa.me/$whatsapp?text=${Uri.parse("I want to order")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var grid = Container(
      child: GridView.count(
        crossAxisCount: 5,
        children: [
          Center(
            child: InkWell(
                child: Column(
                  children: [
                    FittedBox(
                      child: Image.asset(
                        'whatsapp.png',
                        width: 50,
                        height: 50,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                onTap: openwhatsapp),
          ),
          Center(
            child: InkWell(
                child: Column(
                  children: [
                    FittedBox(
                      child: Image.asset(
                        'instagram.png',
                        width: 50,
                        height: 50,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                onTap: () => {launch('https://www.instagram.com/cocoabar_1/')}),
          ),
          Center(
            child: InkWell(
              child: Column(
                children: [
                  FittedBox(
                    child: Image.asset(
                      'menu.png',
                      width: 50,
                      height: 50,
                    ),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              //  onTap: () => {launch('https://g.co/kgs/o7sKKn')}
            ),
          ),
          Center(
            child: InkWell(
                child: Column(
                  children: [
                    FittedBox(
                      child: Image.asset(
                        'facebook.png',
                        width: 50,
                        height: 50,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                onTap: () => {launch('https://www.facebook.com/cocoaabar/')}),
          ),
          Center(
            child: InkWell(
                child: Column(
                  children: [
                    FittedBox(
                      child: Image.asset(
                        'location.png',
                        width: 50,
                        height: 50,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                onTap: () => {launch('https://g.co/kgs/o7sKKn')}),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'logo.png',
              width: 350,
              height: 160,
            )
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage("home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.brown.shade100.withOpacity(0.4),
              ),
              child: Column(
                children: [
                  carousel(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: grid,
                  ))
                ],
              )),
        ),
      ),
    );
  }
}

class carousel extends StatelessWidget {
  var arrayOfImages = [
    'carousel/1.jpg',
    'carousel/2.jpg',
    'carousel/3.jpg',
    'carousel/4.jpg',
    'carousel/5.jpg',
    'carousel/6.jpg',
    'carousel/7.jpg',
    'carousel/8.jpg',
    'carousel/9.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: arrayOfImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(color: Colors.amber),
                child: Image.asset(i));
          },
        );
      }).toList(),
    );
  }
}
