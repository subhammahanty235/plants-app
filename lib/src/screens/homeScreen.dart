// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:plantdirectory/src/components/mostPopularPlantBox.dart';
import 'package:plantdirectory/src/components/plantBox1.dart';
import 'package:plantdirectory/src/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:plantdirectory/src/controllers/plantController.dart';
import 'package:plantdirectory/src/models/plant_model.dart';
import 'package:plantdirectory/src/screens/plantDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textController = TextEditingController();
  final plantController = Get.put(PlantController());
  bool showAll = false;
  bool showSuggestions = false;
  @override
  void initState() {
    print(plantController.plants);
    super.initState();
  }

  @override
  void dispose() {
    print("disposing");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 45, 15, 10),
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: Colors.black54),
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
                                  onChanged: (String value) {
                                    setState(() {
                                      if(value != ''){
                                      plantController.showSuggestions.value =
                                          plantController.plants.any((plant) =>
                                              plant.name.toLowerCase().contains(
                                                  value.toLowerCase()));

                                      }else{
                                        plantController.showSuggestions.value = false;
                                      }
                                    });
                                  },
                                  controller: textController,

                                  // Make sure textController is properly initialized
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey),
                                    prefixIcon: Container(
                                      width: 35,
                                      height: 35,
                                      padding: EdgeInsets.all(5),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        // margin: EdgeInsets.only(right: 4),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: BGgreen,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/icons/plant-svgrepo-com.svg',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    hintText: "Search",
                                    // Other properties like focusColor, iconColor, etc.
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print(plantController.plants[0].name);
                              },
                              child: Container(
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
                            )
                          ],
                        ),
                        Obx(() {
                          return plantController.showSuggestions.isTrue
                              ? Container(
                                  
                                  width: Get.width,
                                  // decoration:
                                      // BoxDecoration(color: Colors.black),
                                  child:
                                    Scrollbar(
                                          thumbVisibility: true,
                                          child: Column(
                                              children: plantController.plants
                                                  .where((plant) => plant.name
                                                      .toLowerCase()
                                                      .contains(textController
                                                          .text
                                                          .toLowerCase()))
                                                  .map<Widget>((plant) {
                                            return

                                            InkWell(
                                              onTap: (() {
                                                Get.to(PlantDetails(plant: plant));
                                              }),
                                              child:
                                             Container(

                                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                              alignment: Alignment.topCenter,
                                              width: Get.width - 20,
                                              height: 35,
                                              padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 2.5),
                                              decoration: BoxDecoration(
                                                color: LightGreen,
                                                borderRadius: BorderRadius.circular(5)

                                              ),
                                              child: Row(
                                                
                                                children: [
                                                Image.network(plant.image , height: 30,width: 25,),
                                                SizedBox(width: 10,),
                                                Text(plant.name , style: TextStyle(fontWeight: FontWeight.w700),)
                                              ],)
                                            ));
                                          }).take(3).toList()),
                                        ),
                                      
                                    
                                  )
                              : Container();
                        }),

                        SizedBox(
                          height: 20,
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
                        Obx(() {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: plantController.plants
                                    .where(
                                        (element) => element.myPlants == true)
                                    .map((plant) {
                              return PlantBox1(data: plant);
                            }).toList()),
                          );
                        }),

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
                            InkWell(onTap: () {
                              plantController.toggleMostPopular();
                            }, child: Obx(() {
                              return Text(
                                plantController.showAll.isFalse
                                    ? "Show All"
                                    : "Show Less",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              );
                            }))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Obx(() {
                          return plantController.showAll.isTrue
                              ? Column(
                                  children: [
                                    GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 15.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 0.635),
                                      itemCount: plantController.plants
                                          .where((element) =>
                                              element.mostPopular == true)
                                          .length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: ((context, index) {
                                        var plant = plantController.plants
                                            .where(((element) =>
                                                element.mostPopular == true))
                                            .toList()[index];
                                        return MostPopularPlant(plant: plant);
                                      }),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: plantController.plants
                                      .where((element) =>
                                          element.mostPopular == true)
                                      .map((e) => MostPopularPlant(
                                            plant: e,
                                          ))
                                      .take(2)
                                      .toList(),
                                );
                        })
                      ]),
                ))));
  }
}
