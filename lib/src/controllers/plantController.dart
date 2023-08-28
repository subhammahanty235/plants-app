import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plantdirectory/src/models/plant_model.dart';

class PlantController extends GetxController {
  RxBool showAll = false.obs; //to extend the most popular section
  RxBool showSuggestions = false.obs;
  RxList<PlantModel> plants = <PlantModel>[].obs;

  @override
  void onInit()async{
    fetchPlants();
    super.onInit();

  }

  void fetchPlants() async {
    final jsonString =
        await rootBundle.loadString('assets/jsons/plantData.json');
    final data = json.decode(jsonString);
    final List<dynamic> plantJsonList = data['plants'];
    plants.assignAll(plantJsonList
        .map<PlantModel>((json) => PlantModel(
            name: json['Name'],
            rating: json['rating'],
            price: json['price'],
            myPlants: json['MyPlants'],
            mostPopular: json['mostPopular'],
            lovedByMe: json['LovedByMe'],
            size: json['size'],
            survivalRequirements: json['survivalRequirements'],
            type: json['Type'],
            description: json['description'],
            image: json['image'])));
  }

  void toggleMostPopular(){
    showAll.value = !showAll.value;
  }
}
