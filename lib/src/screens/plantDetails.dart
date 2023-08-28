// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantdirectory/src/constants/colors.dart';
import 'package:plantdirectory/src/models/plant_model.dart';
import 'package:plantdirectory/src/screens/homeScreen.dart';

class PlantDetails extends StatefulWidget {
  PlantModel plant;
  PlantDetails({super.key , required this.plant});

  @override
  State<PlantDetails> createState() => _PlantDetailsState();
}

class _PlantDetailsState extends State<PlantDetails>
     {
  

  @override
  Widget build(BuildContext context) {
    print(widget.plant.survivalRequirements);
    return Scaffold(
        body: SafeArea(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background-image.png'),
                  fit: BoxFit.cover)),
          child: Stack(children: [
            Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 45, 15, 10),
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: SvgPicture.asset(
                                  'assets/icons/arrow-prev-svgrepo-com.svg',
                                  color: Colors.black,
                                )
                                // SvgPicture.asset(
                                //     'assets/icons/love-svgrepo-com.svg')

                                ),
                            Container(
                                padding: EdgeInsets.all(5),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: widget.plant.lovedByMe == true? BGgreen : LightGreen,
                                    borderRadius: BorderRadius.circular(5)),
                                child: SvgPicture.asset(
                                  'assets/icons/love-svgrepo-com.svg',
                                  color: widget.plant.lovedByMe== false? BGgreen : LightGreen,
                                )),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              (MediaQuery.of(context).size.width - 130),
                              35,
                              0,
                              0),
                          height: (MediaQuery.of(context).size.height * 0.40),
                          width: 100,
                          alignment: Alignment.centerLeft,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Size",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 116, 116),
                                          fontSize: 13),
                                    ),
                                    Text(
                                      widget.plant.size,
                                      style: TextStyle(
                                        color: BGgreen,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Humility",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 116, 116),
                                          fontSize: 13),
                                    ),
                                    Text(
                                     
                                      widget.plant.survivalRequirements['humidity'],
                                      style: TextStyle(
                                        color: BGgreen,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Light",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 116, 116),
                                          fontSize: 13),
                                    ),
                                    Text(
                                      widget.plant.survivalRequirements['light'],
                                      style: TextStyle(
                                        color: BGgreen,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Temperature",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 116, 116),
                                          fontSize: 13),
                                    ),
                                    Text(
                                      widget.plant.survivalRequirements['temperature'],
                                      style: TextStyle(
                                        color: BGgreen,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(15, 55, 15, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.plant.type} Plant",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "\$ ${widget.plant.price}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 18,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "4.5%",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              widget.plant.description,
                              // "Rubber fig Houseplant Flowerpot \nit is added tothe category of decorative \nplants",
                              style: TextStyle(
                                color: Color.fromARGB(255, 116, 113, 113),
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        //buy now button
                        Container(
                            margin: EdgeInsets.only(top: 25),
                            height: 40,
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                              color: BGgreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800),
                                )))
                      ],
                    ),
                  )
                ]),

            //positions
            Positioned(
              top: (MediaQuery.of(context).size.height * 0.35) -
                  140,
              child: Image.network(
                widget.plant.image,
                height: (MediaQuery.of(context).size.height * 0.60) - 100,
              ),
            ),
            Positioned(
                top: (MediaQuery.of(context).size.height * 0.60) - 20,
                left: MediaQuery.of(context).size.width - 120,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: BGgreen, borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    "-   2   +",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ))
          ])),
    ));
  }
}
