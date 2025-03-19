import 'package:donut_app_2b_luis_vera/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  // Lista de donas
  final List burgersOnSale = [
    // [burgerFlavor, burgerStore, burgerPrice, burgerColor, imageName]
    ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/icecream_burger.png"],
    ["Strawberry", "Dunkin burgers", "45", Colors.red, "lib/images/strawberry_burger.png"],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_burger.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_burger.png"],
    ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/icecream_burger.png"],
    ["Strawberry", "Dunkin burgers", "45", Colors.red, "lib/images/strawberry_burger.png"],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_burger.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_burger.png"],
  ];
  
  BurgerTab({super.key});

  @override
  Widget build(BuildContext context) {
    //Cuadrícula
    return GridView.builder(
      //Cuántos elementos hay en nuestra lista
        itemCount: burgersOnSale.length,
        padding: const EdgeInsets.all(8.0),
        //Organiza los elementos en una cuadricula
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Número de columnas
          crossAxisCount: 2,
          //Relación de aspecto (proporción)
          childAspectRatio: 1/1.5),
        itemBuilder: (context, index) {
          return BurgerTile(
            burgerFlavor: burgersOnSale[index][0],
            burgerStore: burgersOnSale[index][1],
            burgerPrice: burgersOnSale[index][2],
            burgerColor: burgersOnSale[index][3],
            imageName: burgersOnSale[index][4],
            
          );
        },
      );
  }
}
