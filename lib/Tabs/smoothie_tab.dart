import 'package:donut_app_2b_luis_vera/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  // Lista de donas
  final List smoothiesOnSale = [
    // [smoothieFlavor, smoothieStore, smoothiePrice, smoothieColor, imageName]
    ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/icecream_smoothie.png"],
    ["Strawberry", "Dunkin smoothies", "45", Colors.red, "lib/images/strawberry_smoothie.png"],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_smoothie.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_smoothie.png"],
    ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/icecream_smoothie.png"],
    ["Strawberry", "Dunkin smoothies", "45", Colors.red, "lib/images/strawberry_smoothie.png"],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_smoothie.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_smoothie.png"],
  ];
  
  SmoothieTab({super.key});

  @override
  Widget build(BuildContext context) {
    //Cuadrícula
    return GridView.builder(
      //Cuántos elementos hay en nuestra lista
        itemCount: smoothiesOnSale.length,
        padding: const EdgeInsets.all(8.0),
        //Organiza los elementos en una cuadricula
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Número de columnas
          crossAxisCount: 2,
          //Relación de aspecto (proporción)
          childAspectRatio: 1/1.5),
        itemBuilder: (context, index) {
          return SmoothieTile(
            smoothieFlavor: smoothiesOnSale[index][0],
            smoothieStore: smoothiesOnSale[index][1],
            smoothiePrice: smoothiesOnSale[index][2],
            smoothieColor: smoothiesOnSale[index][3],
            imageName: smoothiesOnSale[index][4],
            
          );
        },
      );
  }
}
