import 'package:donut_app_2b_luis_vera/utils/smoothie_tile.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  final List smoothieOnSale = [
    // [smoothie, smoothiePrice, smoothieColor, imageName],
     ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/ameicansmoothie.png"],
     ["Strawberry","Dunkin smoothies","45", Colors.red,"lib/images/cocosmoothie.png"],
     ["Grape","Costco","84", Colors.purple,"lib/images/gasoline.png"],
     ["Choco","Walmart","95", Colors.brown, 'lib/images/mangosmoothie.png'],
     ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/mintsmoothie.png"],
     ["Strawberry","Dunkin pizzas","45", Colors.red,"lib/images/secretsmoothie.png"],
     ["Grape","Costco","84", Colors.purple,"lib/images/strawberrysmoothie.png"],
     ["Choco","Walmart","95", Colors.brown, 'lib/images/watermelonsmoothie.png'],
   ];
  final Function(String, double) addToCart;

  SmoothieTab({super.key, required this.addToCart});

  @override
   Widget build(BuildContext context) {
    //Acomodar elementos en Cuadricula
     return GridView.builder(
    //Eementos en nuestra lista
     itemCount: smoothieOnSale.length,
     padding: const EdgeInsets.all(8.0),
     //Organiza como distribuir
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       //numero de columnas
       crossAxisCount: 2,
       childAspectRatio: 1/1.5
       ),
       itemBuilder: (context, index){
          var smoothieTile = SmoothieTile(
            smoothieFlavor: smoothieOnSale[index][0],
            smoothieStore: smoothieOnSale[index][1],
            smoothiePrice: smoothieOnSale[index][2],
            imageName: smoothieOnSale[index][4],
            smoothie: smoothieOnSale[index][3],
            addToCart: addToCart,
          );
          return smoothieTile;
        }
      );
  }
}