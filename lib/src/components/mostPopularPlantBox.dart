// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantdirectory/src/constants/colors.dart';

class MostPopularPlant extends StatelessWidget {
  const MostPopularPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: (MediaQuery.of(context).size.width - 45) / 2,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: LightGreen, borderRadius: BorderRadius.circular(8)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 70,
            width: ((MediaQuery.of(context).size.width - 45) / 2) - 20,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Banana Tree",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w800),
                ),
                Row(
                  children: [
                    Icon(Icons.star , color: Colors.red,size: 11,),
                    Text(
                  "4.5",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 11,
                      fontWeight: FontWeight.w800),
                ),
                  ],
                ),
                Text(
                  "\$ 24.00",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w800),
                ),
                
              ],
            ),
          ),
          Positioned(
            height: 170,
            bottom: 60,
            child: Image.asset('assets/images/plant-2.png' , colorBlendMode: BlendMode.darken,)),
             Positioned(
              left:(((MediaQuery.of(context).size.width - 45) / 2) - 20)-21,
              bottom: 210,
                child: Container(
              padding: EdgeInsets.all(2),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              child: SvgPicture.asset('assets/icons/love-svgrepo-com.svg' , color: BGgreen,)
            ),
            
            )
        ],
      ),
    );
  }
}
