import 'package:fitlytic/UI/Home/bmi_ui.dart';
import 'package:fitlytic/constants/custom_colors.dart';
import 'package:flutter/material.dart';

Widget BmiContainer(BuildContext context){
  return Stack(
              children: [
                Image.asset(
                  "assets/bmi_background.png",
                  width: 500,
                  fit: BoxFit.fill,
                ),
                const Positioned(
                  top: 30,
                  left: 25,
                  child: Text(
                    "BMI (Body Mass Index)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Positioned(
                  top: 60,
                  left: 25,
                  child: Text(
                    "You have a normal body",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Positioned(
                    top: 95,
                    left: 25,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const BMICalculatorScreen()));
                      },
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(MyColors.primaryPurple),
                      ),
                      child: const Text(
                        "View More",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            );
}

