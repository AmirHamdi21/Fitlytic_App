import 'package:fitlytic/UI/Home/start_screen.dart';
import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class CustomAppBar extends StatelessWidget {
  bool isleadingicon;
  bool istrailingicon;
  String title;
  CustomAppBar(
      {super.key,
      required this.isleadingicon,
      required this.istrailingicon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      isleadingicon
          ? IconButton(
              hoverColor: MyColors.grey2,
              iconSize: 24.0,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: MyColors.black,
              ),
            )
          : Container(),
      Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      istrailingicon
          ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: MyColors.grey3
            ),
            child: IconButton(
                hoverColor: MyColors.grey2,
                iconSize: 26.0,
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: MyColors.black,
                ),
              ),
          )
          : Container(),
    ]);
  }
}
