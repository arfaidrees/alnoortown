import 'package:al_noor_town/Screens/light%20_wires_work.dart';
import 'package:al_noor_town/Screens/pipe_lying.dart';
import 'package:al_noor_town/Screens/poles.dart';
import 'package:flutter/material.dart';
import 'backfilling.dart';
import 'exavation.dart';
import 'manholes.dart';
import 'machines.dart';
import 'poles_foundation.dart';
import 'water_tanker.dart';

class DevelopmentPage extends StatefulWidget {
  const DevelopmentPage({super.key});

  @override
  State<DevelopmentPage> createState() => _DevelopmentPageState();
}

class _DevelopmentPageState extends State<DevelopmentPage> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool startAnimation = false;

  List<String> texts = [
    "Road Maintenance",
    "Sewerage Work",
    "Light Poles Work",
    "MainDrain Work",
  ];

  List<String> imagePaths = [
    "assets/images/road_maintenance.png",
    "assets/images/maindrain_work.png",
    "assets/images/light_poles_work.png",
    "assets/images/sewerage_work.png",
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 20),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: texts.length,
                    itemBuilder: (context, index) {
                      return item(index);
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(int index) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Pick Your Machinery',
                    style: TextStyle(
                      color: Color(0xFFC69840),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Machines()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/machines.png',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Machine',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC69840),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WaterTanker()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/water_tanker.png',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Water Tanker',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC69840),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: const Text(
                        'Close',
                        style: TextStyle(color: Color(0xFFC69840)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 5,
                  contentPadding: const EdgeInsets.all(20),
                );
              },
            );
            break;
          case 1:
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Select your Work',
                    style: TextStyle(
                      color: Color(0xFFC69840),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Exavation()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/exavation.png',
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Exavation',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC69840),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Backfiling()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/backfiling.png',
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Back Filling',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC69840),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 20), // Adjust height as needed
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Manholes()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/manholes.png',
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Manholes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC69840),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Pipeline()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/pipelines.png',
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Pipelines',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC69840),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: const Text(
                        'Close',
                        style: TextStyle(color: Color(0xFFC69840)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 5,
                  contentPadding: const EdgeInsets.all(20),
                );
              },
            );
            break;
          case 2:
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Select Your Work',
                    style: TextStyle(
                      color: Color(0xFFC69840),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const Polesfoundation()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/pol-01.png',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Poles Exavation',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC69840),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Poles()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/polesssssss-01.png',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Poles',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC69840),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LightWiresWork()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/lightwire-01.png',
                              height: 100,
                              width: 100,
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Light Wires',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFC69840),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: const Text(
                        'Close',
                        style: TextStyle(color: Color(0xFFC69840)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 5,
                  contentPadding: const EdgeInsets.all(20),
                );
              },
            );
            break;
          case 3:

            break;
        }
      },
      child: AnimatedContainer(
        height: 130,
        width: screenWidth,
        curve: Curves.linear,
        duration: Duration(milliseconds: 300 + (index * 200)),
        transform:
        Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0.3, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePaths[index],
                height: 58,
                width: 57,
              ),
            ),
            Container(
              width: 0.7,
              height: 80,
              color: Colors.grey.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  texts[index],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFC69840),
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
