class PlantModel {
  final String name;
  final double rating;
  final double price;
  final bool myPlants;
  final bool mostPopular;
  final bool lovedByMe;
  final String size;
  final Map<String, dynamic> survivalRequirements;
  final String type;
  final String description;
  final String image;

  PlantModel({
    required this.name,
    required this.rating,
    required this.price,
    required this.myPlants,
    required this.mostPopular,
    required this.lovedByMe,
    required this.size,
    required this.survivalRequirements,
    required this.type,
    required this.description,
    required this.image,
  });
}
