import 'package:donut_app_2b_luis_vera/utils/pizza_tile.dart';
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  // Lista de donas
  final List pizzasOnSale = [
    // [pizzaFlavor, pizzaStore, pizzaPrice, pizzaColor, imageName]
    ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/icecream_pizza.png"],
    ["Strawberry", "Dunkin pizzas", "45", Colors.red, "lib/images/strawberry_pizza.png"],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_pizza.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_pizza.png"],
    ["Ice Cream","Krispy Kreme", "36", Colors.blue, "lib/images/icecream_pizza.png"],
    ["Strawberry", "Dunkin pizzas", "45", Colors.red, "lib/images/strawberry_pizza.png"],
    ["Grape Ape", "Costco", "84", Colors.purple, "lib/images/grape_pizza.png"],
    ["Choco", "Walmart", "95", Colors.brown, "lib/images/chocolate_pizza.png"],
  ];
  
  PizzaTab({super.key});

  @override
  Widget build(BuildContext context) {
    //Cuadrícula
    return GridView.builder(
      //Cuántos elementos hay en nuestra lista
        itemCount: pizzasOnSale.length,
        padding: const EdgeInsets.all(8.0),
        //Organiza los elementos en una cuadricula
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Número de columnas
          crossAxisCount: 2,
          //Relación de aspecto (proporción)
          childAspectRatio: 1/1.5),
        itemBuilder: (context, index) {
          return PizzaTile(
            pizzaFlavor: pizzasOnSale[index][0],
            pizzaStore: pizzasOnSale[index][1],
            pizzaPrice: pizzasOnSale[index][2],
            imageName: pizzasOnSale[index][3],
            
          );
        },
      );
  }
}
