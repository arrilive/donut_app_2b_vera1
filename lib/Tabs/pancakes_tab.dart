import 'package:donut_app_2b_luis_vera/utils/pancakes_tile.dart';
import 'package:flutter/material.dart';

class PancakesTab extends StatelessWidget {
  final List pancakesOnSale = [
    // [pancakes, pancakesPrice, pancakesColor, imageName],
     ["BlackBerry","Vips", "36", Colors.blue, "lib/images/blackberrypancake.png"],
     ["Butter","Dunkin","45", Colors.red,"lib/images/butterpancake.png"],
     ["Cherry","IHope","84", Colors.purple,"lib/images/cherrypancake.png"],
     ["Dirty","Walmart","95", Colors.brown, 'lib/images/dirtytpancake.png'],
     ["House","Vips", "36", Colors.blue, "lib/images/housepancake.png"],
     ["Strawberry","Dunkin","45", Colors.red,"lib/images/straweberrypancake.png"],
     ["Lovely","IHope","84", Colors.purple,"lib/images/lovelypancake.png"],
     ["Simple","Walmart","95", Colors.brown, 'lib/images/simplepancake.png'],    
   ];
  final Function(String, double) addToCart;

  PancakesTab({super.key, required this.addToCart});

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
            pancakesFlavor: pancakesOnSale[index][0],
            pancakesStore: pancakesOnSale[index][1],
            pancakesPrice: pancakesOnSale[index][2],
            imageName: pancakesOnSale[index][4],
            pancakes: pancakesOnSale[index][3],
            addToCart: addToCart,
            
          );
          return pancakesTile;
        }
      );
  }
}