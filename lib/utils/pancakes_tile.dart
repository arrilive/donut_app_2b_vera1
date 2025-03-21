
import 'package:flutter/material.dart';

class PancakesTile extends StatelessWidget {
  final String pancakesFlavor;
  final String pancakesPrice;
  final MaterialColor pancakes;
  final String imageName;
  final String pancakesStore;
  final Function(String, double) addToCart;

  const PancakesTile({super.key, required this.pancakesFlavor, required this.pancakesStore, required this.pancakesPrice, required this.pancakes, required this.imageName, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color:pancakes[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            //PriceTag
            Row(
              //Alinea a la derecha

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: pancakes[200],
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
                    '\$$pancakesPrice', 
                    style: TextStyle(
                      fontWeight:FontWeight.bold, 
                      fontSize: 18,
                      color: pancakes[800]
                    )
                  )
                )
              ],
            ),
            //pancakesPicture
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(imageName),
            ),
            //pancakesText
            Text(pancakesFlavor, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20)
            ),
            SizedBox(
              height: 4,
            ),
            //TODO: agregar texto de la tienda
            Text(pancakesStore, style: TextStyle(
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
                      addToCart(pancakesFlavor, double.parse(pancakesPrice));
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
