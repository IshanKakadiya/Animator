// ignore_for_file: camel_case_types, unused_element

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planet_app/Globle.dart';

class Details_Page extends StatefulWidget {
  const Details_Page({super.key});

  @override
  State<Details_Page> createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page>
    with TickerProviderStateMixin {
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
    totalData({required String title, required String value}) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.45,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: Colors.white.withOpacity(0.7),
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${Globle.planetDetails[Globle.index]["name"]} Details"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(height: 10),
            Transform.rotate(
              angle: rotationAnimation.value,
              child: Image.asset(
                "${Globle.planetDetails[Globle.index]["images"]}",
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              Globle.planetDetails[Globle.index]["name"],
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                totalData(
                  title: "Color",
                  value: "${Globle.planetDetails[Globle.index]["color"]}",
                ),
                totalData(
                  title: "Diameter",
                  value: "${Globle.planetDetails[Globle.index]["Diameter"]}",
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                totalData(
                  title: "Orbit",
                  value: "${Globle.planetDetails[Globle.index]["Orbit"]}",
                ),
                totalData(
                  title: "Day",
                  value: "${Globle.planetDetails[Globle.index]["Day"]}",
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                totalData(
                  title: "Total Moons",
                  value:
                      "${Globle.planetDetails[Globle.index]["Number of moons"]}",
                ),
                totalData(
                  title: "Distance Of Sun",
                  value:
                      "${Globle.planetDetails[Globle.index]["Distance from Sun"]}",
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                totalData(
                  title: "Volume",
                  value: "${Globle.planetDetails[Globle.index]["Volume"]}",
                ),
                totalData(
                  title: "Mass",
                  value: "${Globle.planetDetails[Globle.index]["Mass"]}",
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                totalData(
                  title: "Planet type",
                  value: "${Globle.planetDetails[Globle.index]["Planet type"]}",
                ),
                totalData(
                  title: "Temperature",
                  value:
                      "${Globle.planetDetails[Globle.index]["Surface temperature"]}",
                ),
              ],
            ),
            const SizedBox(height: 12),
            totalData(
              title: "Discription",
              value: "${Globle.planetDetails[Globle.index]["Discription"]}",
            ),
          ],
        ),
      ),
    );
  }
}
