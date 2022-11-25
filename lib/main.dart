// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home(),
  ));
}

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  late AnimationController femaleAnimationController;
  late AnimationController maleAnimationController;
  late AnimationController weightAnimationController;
  late AnimationController ageAnimationController;

  late Animation femaleHeightAnimation;
  late Animation femaleWidthAnimation;
  late Animation maleHeightAnimation;
  late Animation maleWidthAnimation;
  late Animation weightAnimation;
  late Animation ageAnimation;

  @override
  void initState() {
    super.initState();

    // Female Aanimation
    femaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    femaleHeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 180, end: 185), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 185, end: 180), weight: 1),
    ]).animate(femaleAnimationController);

    femaleWidthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 145, end: 150), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 150, end: 145), weight: 1),
    ]).animate(femaleAnimationController);

    femaleAnimationController.addListener(() {
      setState(() {});
    });

    // Male Animation
    maleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    maleHeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 180, end: 185), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 185, end: 180), weight: 1),
    ]).animate(maleAnimationController);

    maleWidthAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 145, end: 150), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 150, end: 145), weight: 1),
    ]).animate(maleAnimationController);

    maleAnimationController.addListener(() {
      setState(() {});
    });

    // Weight Animation

    weightAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    weightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 45, end: 50), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 45), weight: 1),
    ]).animate(weightAnimationController);

    weightAnimationController.addListener(() {
      setState(() {});
    });

    // Age Animation

    ageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    ageAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 45, end: 50), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 45), weight: 1),
    ]).animate(ageAnimationController);

    ageAnimationController.addListener(() {
      setState(() {});
    });

    femaleAnimationController.forward();
    maleAnimationController.forward();
    weightAnimationController.forward();
    ageAnimationController.forward();
  }

  double heights = 150;
  double weight = 60;
  double age = 28;
  bool changecolor = false;
  bool secondcolor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff090e21),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color(0xff090e21),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      changecolor = true;
                      secondcolor = false;
                      if (femaleAnimationController.isDismissed) {
                        femaleAnimationController.forward();
                      } else if (femaleAnimationController.isCompleted) {
                        femaleAnimationController.reverse();
                      }
                    });
                  },
                  child: Ink(
                    child: Container(
                      height: femaleHeightAnimation.value,
                      width: femaleWidthAnimation.value,
                      decoration: BoxDecoration(
                        color: (changecolor == true)
                            ? const Color(0xff3b3c4d)
                            : const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.female,
                            color: (changecolor == true)
                                ? const Color(0xffeb1555)
                                : Colors.white,
                            size: 100,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                color: (changecolor == true)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      secondcolor = true;
                      changecolor = false;

                      if (maleAnimationController.isDismissed) {
                        maleAnimationController.forward();
                      } else if (maleAnimationController.isCompleted) {
                        maleAnimationController.reverse();
                      }
                    });
                  },
                  child: Ink(
                    child: Container(
                      height: maleHeightAnimation.value,
                      width: maleWidthAnimation.value,
                      decoration: BoxDecoration(
                        color: (secondcolor == true)
                            ? const Color(0xff3b3c4d)
                            : const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.male,
                            color: (secondcolor == true)
                                ? const Color(0xffeb1555)
                                : Colors.white,
                            size: 100,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                color: (secondcolor == true)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: const Color(0xff1d1e33),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(height: 150),
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                            color: Color(0xff626473),
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${heights.toInt()}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            const TextSpan(
                              text: " cm",
                              style: TextStyle(
                                color: Color(0xff626473),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),

                        Slider(
                          min: 50,
                          max: 250,
                          value: heights,
                          label: "${heights.toInt()}",
                          divisions: 100,
                          thumbColor: const Color(0xffeb1555),
                          activeColor: const Color(0xfff5c1d1),
                          inactiveColor: const Color(0xff555555),
                          onChanged: (val) {
                            setState(() {
                              heights = val;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "${weight.toInt()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: weightAnimation.value,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (weight >= 2) {
                                      weight--;
                                    }

                                    if (weightAnimationController.isDismissed) {
                                      weightAnimationController.forward();
                                    } else if (weightAnimationController
                                        .isCompleted) {
                                      weightAnimationController.reverse();
                                    }
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff4c4f5e),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 35, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    weight++;

                                    if (weightAnimationController.isDismissed) {
                                      weightAnimationController.forward();
                                    } else if (weightAnimationController
                                        .isCompleted) {
                                      weightAnimationController.reverse();
                                    }
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff6e6f7a),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xfff67fa4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {},
                  child: Ink(
                    child: Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "${age.toInt()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ageAnimation.value,
                                fontWeight: FontWeight.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (age >= 2) {
                                      age--;
                                    }

                                    if (ageAnimationController.isDismissed) {
                                      ageAnimationController.forward();
                                    } else if (ageAnimationController
                                        .isCompleted) {
                                      ageAnimationController.reverse();
                                    }
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff4c4f5e),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 35, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    age++;

                                    if (ageAnimationController.isDismissed) {
                                      ageAnimationController.forward();
                                    } else if (ageAnimationController
                                        .isCompleted) {
                                      ageAnimationController.reverse();
                                    }
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff6e6f7a),
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xfff67fa4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Ink(
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffeb1555),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Calculator",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
