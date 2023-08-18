// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantdirectory/src/components/mostPopularPlantBox.dart';
import 'package:plantdirectory/src/components/plantBox1.dart';
import 'package:plantdirectory/src/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textController = TextEditingController();
  var pllist = ["p1", "p2", "p3", "p3", "p4", "p5", "p6"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 45, 15, 10),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //welcome text and notification icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //welcome text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14 , color: Colors.black54),
                    ),
                    Text("SUBHAM MAHANTY",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              letterSpacing: 1,
                              fontFamily: 'Plus_Jakarta_Sans'),
                        ))
                  ],
                ),
                //notification icon
                SvgPicture.asset(
                    'assets/icons/notification-alert-svgrepo-com.svg')
              ],
            ),

            //search bar and filter icon
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.78,
                  // width: 100,
                  decoration: BoxDecoration(
                    color:
                        LightGreen, // Ensure LightGreen is defined or use Colors.lightGreen
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: SizedBox(
                    // height: 40,
                    child: TextField(
                      controller:
                          textController, // Make sure textController is properly initialized
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Container(
                          width: 35,
                          margin: EdgeInsets.only(right: 4),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              border: Border(
                                  right: BorderSide(
                                      color: Colors.grey, width: 2))),
                          child: SvgPicture.asset(
                            'assets/icons/plant-svgrepo-com.svg',
                            color: Color.fromARGB(255, 114, 113, 113),
                          ),
                        ),
                        hintText: "Search",
                        // Other properties like focusColor, iconColor, etc.
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color:
                        LightGreen, // Ensure LightGreen is defined or use Colors.lightGreen
                    borderRadius: BorderRadius.circular(7),
                  ),
                  width: 35,
                  height: 35,
                  child: SvgPicture.asset(
                    'assets/icons/filter-svgrepo-com.svg',
                    color: Color.fromARGB(255, 114, 113, 113),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20,),
            // Container(
            // height: 120,
            // child:
            // Row(children: [
            //   ListView.builder(
            //     itemCount:2,
            //     itemBuilder:((context, index) {
            //       return PlantBox1();
            //   }) )

            // ],)
            // )
            SizedBox(
              height: 25,
            ),
            Text(
              "My Plants",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PlantBox1(),
                  PlantBox1(),
                  PlantBox1(),
                  PlantBox1(),
                  PlantBox1(),
                  PlantBox1(),
                ],
              ),
            ),

            //most Popular section
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/dots-svgrepo-com.svg',
                      height: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Most Popular",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Text(
                  "Show All",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [MostPopularPlant(), MostPopularPlant()],
            )
          ]),
        ),
      ),
    );
  }
}
