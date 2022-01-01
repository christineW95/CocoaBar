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
  var whatsappURl_android = "whatsapp://send?phone=01150553217&text=hello";
  var whatappURL_ios = "https://wa.me/01115060678?text=${Uri.parse("hello")}";

  openwhatsapp() async {
    var whatsapp = "+201150553217";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=اطلب اوردر:";
    var whatappURL_ios =
        "https://wa.me/$whatsapp?text=${Uri.parse("اطلب اوردر:")}";
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
    var grid = GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: [
        Center(
          child: InkWell(
              child: Column(
                children: [
                  Container(
                    child: FittedBox(
                      child: Image.asset(
                        'assets/talabat.png',
                        width: 100,
                        height: 100,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'اطلب اوردر',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () => {launch('https://bit.ly/3mM5yiZ')}),
        ),
        Center(
          child: InkWell(
              child: Column(
                children: [
                  FittedBox(
                    child: Image.asset(
                      'assets/instagram.png',
                      width: 100,
                      height: 100,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'انستجرام',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )
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
                      'assets/menu.png',
                      width: 100,
                      height: 100,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'المنيو',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () => {
                    launch(
                        'https://m.facebook.com/cocoaabar/photos/p.125321116644510/125321116644510')
                  }),
        ),
        Center(
          child: InkWell(
              child: Column(
                children: [
                  FittedBox(
                    child: Image.asset(
                      'assets/facebook.png',
                      width: 100,
                      height: 100,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'فيسبوك',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )
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
                      'assets/location.png',
                      width: 100,
                      height: 100,
                    ),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'اقرب فرع',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              onTap: () => {launch('https://g.co/kgs/o7sKKn')}),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 360,
                height: 150,
              )
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage("assets/background.jpeg"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.brown.shade100.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 220.0),
                child: Center(
                  child: grid,
                ),
              )),
        ),
      ),
    );
  }
}

class carousel extends StatelessWidget {
  var arrayOfImages = [
    'assets/carousel/1.jpeg',
    'assets/carousel/2.jpeg',
    'assets/carousel/3.jpeg',
    'assets/carousel/4.jpeg',
    'assets/carousel/5.jpeg',
    'assets/carousel/6.jpeg',
    'assets/carousel/7.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        aspectRatio: 20 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: arrayOfImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // decoration: BoxDecoration(color: Colors.amber),
                child: Image.asset(i));
          },
        );
      }).toList(),
    );
  }
}
