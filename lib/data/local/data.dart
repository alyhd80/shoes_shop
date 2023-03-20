import 'dart:ui';

class NikeShoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final Color color;

  NikeShoes( 
      {required this.model,
      required this.oldPrice,
      required this.currentPrice,
      required this.images,
      required this.modelNumber,
      required this.color});
}

class Data {
  final shoes = <NikeShoes>[
    NikeShoes(
        model: "AIR MAX 90 EZ BLACK",
        oldPrice: 299,
        currentPrice: 149,
        images: [
          "assets/images/shoes1_1.png",
          "assets/images/shoes1_2.png",
          "assets/images/shoes1_3.png"
        ],
        modelNumber: 90,
        color: Color(0xFFF6F6F6)),
    NikeShoes(
        model: "AIR MAX 90",
        oldPrice: 399,
        currentPrice: 254,
        images: [
          "assets/images/shoes2_1.png",
          "assets/images/shoes2_2.png",
          "assets/images/shoes2_3.png"
        ],
        modelNumber: 95,
        color: Color(0xFFFCF5EB)),
    NikeShoes(
        model: "AIR MAX 270 Gold",
        oldPrice: 399,
        currentPrice: 299,
        images: [
          "assets/images/shoes3_1.png",
          "assets/images/shoes3_2.png",
          "assets/images/shoes3_3.png"
        ],
        modelNumber: 270,
        color: Color(0xFFFEEFEF)),
    NikeShoes(
        model: "AIR MAX 98 FREE",
        oldPrice: 299,
        currentPrice: 149,
        images: [
          "assets/images/shoes4_1.png",
          "assets/images/shoes4_2.png",
          "assets/images/shoes4_3.png"
        ],
        modelNumber: 98,
        color: Color(0xFFEDF3FE)),
  ];
}
