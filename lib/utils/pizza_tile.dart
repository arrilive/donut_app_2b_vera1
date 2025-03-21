import 'package:flutter/material.dart';

class PizzaTile extends StatelessWidget {
  final String pizzaFlavor;
  final String pizzaPrice;
  final MaterialColor pizza;
  final String imageName;
  final String pizzaStore;
  final Function(String, double) addToCart;

  const PizzaTile({super.key, required this.pizzaFlavor, required this.pizzaStore, required this.pizzaPrice, required this.pizza, required this.imageName, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color:pizza[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            //PriceTag
            Row(
              //Alinea a la derecha

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pizza[200],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24)
                    )
                  ),
                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 8, 
                    horizontal:18
                  ),
                  child:Text(
                    '\$$pizzaPrice', 
                    style: TextStyle(
                      fontWeight:FontWeight.bold, 
                      fontSize: 18,
                      color: pizza[800]
                    )
                  )
                )
              ],
            ),
            //pizzaPicture
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(imageName),
            ),
            //pizzaText
            Text(pizzaFlavor, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20)
            ),
            SizedBox(
              height: 4,
            ),
            //TODO: agregar texto de la tienda
            Text(pizzaStore, style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17,
              color: Colors.blueGrey)
            ),
            SizedBox(
              height: 4,
            ),
            //LoveIcon+AddButton
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border, color: Colors.pink[400]),
                  GestureDetector(
                    onTap: () {
                      // Agregar al carrito
                      addToCart(pizzaFlavor, double.parse(pizzaPrice));
                    },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}