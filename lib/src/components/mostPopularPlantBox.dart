// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantdirectory/src/constants/colors.dart';
import 'package:plantdirectory/src/models/plant_model.dart';
import 'package:plantdirectory/src/screens/homeScreen.dart';
import 'package:plantdirectory/src/screens/plantDetails.dart';

class MostPopularPlant extends StatelessWidget {
  PlantModel plant;
  MostPopularPlant({super.key, required this.plant});

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
                  plant.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w800),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 11,
                    ),
                    Text(
                      plant.rating.toString(),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 11,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                Text(
                  "\$ ${plant.price}",
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
              bottom: 50,
              child: Image.network(
                plant.image,
                colorBlendMode: BlendMode.darken,
                // color: Colors.black,
              )),
          Positioned(
            left: (((MediaQuery.of(context).size.width - 45) / 2) - 20) - 21,
            bottom: 210,
            child: Container(
                padding: EdgeInsets.all(2),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: plant.lovedByMe == true
                    ? SvgPicture.asset(
                        'assets/icons/love-svgrepo-com.svg',
                        color: BGgreen,
                      )
                    : SvgPicture.asset(
                        'assets/icons/love-svgrepo-com.svg',
                        color: Colors.redAccent,
                      )),
          ),
          Positioned(
              bottom: 5,
              right: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlantDetails(plant: plant)));
                },
                child: Container(
                  width: 50,
                  height: 35,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  child: Container(
                      alignment: Alignment.center,
                      width: 45,
                      height: 30,
                      // margin: EdgeInsets.only(right: 4),
                      // padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: LightGreen,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(Icons.remove_red_eye_rounded)),
                ),
              ))
        ],
      ),
    );
  }
}
