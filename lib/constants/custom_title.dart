import 'package:fitlytic/UI/Home/notifications.dart';
import 'package:flutter/material.dart';
import 'custom_colors.dart';

Widget CustomTitle(BuildContext context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome Back,',
          style: TextStyle(fontSize: 18, color: MyColors.grey1),
        ),
        ShaderMask(
          shaderCallback: (bounds) =>
              MyColors.customGradient.createShader(bounds),
          child: const Text(
            "Amir Hamdi",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
    Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: MyColors.grey2),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  const Notifications())); // This removes the previous route from the stack
        },
        icon: const Icon(Icons.notifications),
      ),
    ),
  ]);
}
