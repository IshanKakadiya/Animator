// ignore_for_file: unused_element

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planet_app/Globle.dart';
import 'package:planet_app/details.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MyApp(),
        "Details_Page": (context) => const Details_Page(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation rotationAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    rotationAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(animationController);

    animationController.repeat();

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planet App"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Container(
        child: ListView.separated(
            padding: const EdgeInsets.all(15),
            physics: const BouncingScrollPhysics(),
            itemCount: Globle.planetDetails.length,
            separatorBuilder: (context, i) => const SizedBox(height: 20),
            itemBuilder: (context, i) {
              return Container(
                padding: const EdgeInsets.only(
                    left: 12, right: 10, top: 15, bottom: 15),
                height: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.3,
                    image: AssetImage(
                      "${Globle.planetDetails[i]["images"]}",
                    ),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("Details_Page");
                    setState(() {
                      Globle.index = i;
                    });
                  },
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Globle.planetDetails[i]["name"],
                            style: GoogleFonts.openSans(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            ),
                          ),
                          Text(
                            "Color : ${Globle.planetDetails[i]["color"]}",
                            style: GoogleFonts.openSans(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Diameter : ${Globle.planetDetails[i]["Diameter"]}",
                            style: GoogleFonts.openSans(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Moons : ${Globle.planetDetails[i]["Number of moons"]}",
                            style: GoogleFonts.openSans(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Temperature : ${Globle.planetDetails[i]["Surface temperature"]}",
                            style: GoogleFonts.openSans(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Transform.rotate(
                        angle: rotationAnimation.value,
                        child: Image.asset(
                          "${Globle.planetDetails[i]["images"]}",
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
