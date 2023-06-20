import 'package:bmicalculater/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int Weight = 70;

  String gender='';
  
  late double bmi = calculatBMI(height: height, Weight: Weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 157, 156, 156),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      print("male");
                      setState(() {
                        
                      gender='M';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:gender=='M'?  Color.fromARGB(255, 105, 243, 42):Color.fromARGB(255, 146, 187, 138),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.male,
                            size: 150,
                          ),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                 const Spacer(),
                  GestureDetector(
                    onTap: (){
                      print("female");
                      setState(() {
                        
                      gender='F';
                      });
                    },

                    child: Container(
                      decoration: BoxDecoration(
                          color:gender=='F'? Color.fromARGB(255, 105, 243, 42):Color.fromARGB(255, 146, 187, 138),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.female,
                            size: 150,
                          ),
                          Text("Female"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Height"),
                        Text(
                          "$height",
                          style: KInputlablecolor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) height--;
                                  bmi = calculatBMI(
                                      height: height, Weight: Weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 220) height++;
                                  bmi = calculatBMI(
                                      height: height, Weight: Weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text("Weight"),
                        Text(
                          "$Weight",
                          style: KInputlablecolor,
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (Weight > 20) Weight--;
                                  bmi = calculatBMI(
                                      height: height, Weight: Weight);
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (Weight < 220) Weight++;
                                  bmi = calculatBMI(
                                      height: height, Weight: Weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text("BMI"),
                  Text(
                    "${bmi.toStringAsFixed(2)}",
                    style: KInputlablecolor.copyWith(
                        color: koutputcolor, fontSize: 60),
                  ),
                  Text(
                    getResult(bmi),
                    style: TextStyle(
                        color: Color.fromARGB(255, 86, 58, 58), fontSize: 30),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculatBMI({required int height, required int Weight}) {
    return (Weight / (height * height) * 10000);
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'OverWeight';
    } else if (bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }
}
