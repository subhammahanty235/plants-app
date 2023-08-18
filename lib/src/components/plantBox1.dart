// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantdirectory/src/constants/colors.dart';

class PlantBox1 extends StatelessWidget {
  const PlantBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        width: 110,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: BGgreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/plant-3.png',
                    height: 85,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Costa Farm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Indoor",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              left:76,
                child: Container(
              padding: EdgeInsets.all(2),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: SvgPicture.asset('assets/icons/love-svgrepo-com.svg')
            ),
            
            )
          ],
        ));
  }
}
