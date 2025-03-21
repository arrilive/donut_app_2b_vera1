import 'package:donut_app_2b_luis_vera/utils/burger_tile.dart';
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  final Function(String, double) addToCart;

  BurgerTab({super.key, required this.addToCart});
  
  final List burgerOnSale = [
    // [burger, burgerPrice, burgerColor, imageName],
     ["Normal", "Burger King", "36", Colors.blue, "lib/images/AjonjoliBurger.png"],
     ["American", "McDonald", "45", Colors.red, "lib/images/AmericanBurger.png"],
     ["Basic", "Carls Jr", "84", Colors.purple, "lib/images/Basic.png"],
     ["Burger W/ Fries", "Angry Angus", "95", Colors.brown, 'lib/images/BurgerAndFries.png'],
     ["Captain","Burger King", "36",Colors.lime, "lib/images/CaptainBurger.png"],
     ["Combo","My Home","45",Colors.blue,"lib/images/ComboBurger.png"],
     ["Large","Carls Jr","84",Colors.blueGrey,"lib/images/LargeBurger.png"],
     ["Sabro","Angry Angus","95", Colors.pink,'lib/images/SabroBurger.png'],
   ];

  @override
   Widget build(BuildContext context) {
    //Acomodar elementos en Cuadricula
     return GridView.builder(
    //Eementos en nuestra lista
     itemCount: burgerOnSale.length,
     padding: const EdgeInsets.all(8.0),
     //Organiza como distribuir
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       //numero de columnas
       crossAxisCount: 2,
       childAspectRatio: 1/1.5
       ),
       itemBuilder: (context, index){
          var burgerTile = BurgerTile(
            burgerFlavor: burgerOnSale[index][0],
    burgerStore: burgerOnSale[index][1],
    burgerPrice: burgerOnSale[index][2],
    imageName: burgerOnSale[index][4],
    burger: burgerOnSale[index][3],
    addToCart: addToCart,
            
          );
          return burgerTile;
        }
      );
  }
}