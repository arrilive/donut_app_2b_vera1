import 'package:donut_app_2b_luis_vera/utils/pancakes_tile.dart';
import 'package:flutter/material.dart';
 
class PancakesTab extends StatelessWidget {
  final List pancakesOnSale = [
    // [pancakes, pancakesPrice, pancakesColor, imageName],
     ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/icecream_pancakes.png"],
     ["Strawberry","Dunkin pancakess","45", Colors.red,"lib/images/strawberry_pancakes.png"],
     ["Grape","Costco","84", Colors.purple,"lib/images/grape_pancakes.png"],
     ["Choco","Walmart","95", Colors.brown, 'lib/images/chocolate_pancakes.png'],
     ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/icecream_pancakes.png"],
     ["Strawberry","Dunkin pancakess","45", Colors.red,"lib/images/strawberry_pancakes.png"],
     ["Grape","Costco","84", Colors.purple,"lib/images/grape_pancakes.png"],
     ["Choco","Walmart","95", Colors.brown, 'lib/images/chocolate_pancakes.png'],
   ];
  PancakesTab({super.key});
 
  @override
   Widget build(BuildContext context) {
    //Acomodar elementos en Cuadricula
     return GridView.builder(
    //Eementos en nuestra lista
     itemCount: pancakesOnSale.length,
     padding: const EdgeInsets.all(8.0),
     //Organiza como distribuir
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       //numero de columnas
       crossAxisCount: 2,
       childAspectRatio: 1/1.5
       ),
       itemBuilder: (context, index){
          var pancakesTile = PancakesTile(
            pancakes: pancakesOnSale[index][0],
            pancakesStore: pancakesOnSale[index][1],
            pancakesPrice:pancakesOnSale[index][2],
            imageName:pancakesOnSale[index][3],
            pancakesFlavor: pancakesOnSale[index][4],
           
          );
          return pancakesTile;
        }
      );
  }
}
 