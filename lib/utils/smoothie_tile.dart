import 'package:flutter/material.dart';

class SmoothieTile extends StatelessWidget {
  final String smoothieFlavor;
  final String smoothiePrice;
  final MaterialColor smoothie;
  final String imageName;
  final String smoothieStore;
  final Function(String, double) addToCart;

  const SmoothieTile({super.key, required this.smoothieFlavor, required this.smoothieStore, required this.smoothiePrice, required this.smoothie, required this.imageName, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color:smoothie[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            //PriceTag
            Row(
              //Alinea a la derecha

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: smoothie[200],
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
                    '\$$smoothiePrice', 
                    style: TextStyle(
                      fontWeight:FontWeight.bold, 
                      fontSize: 18,
                      color: smoothie[800]
                    )
                  )
                )
              ],
            ),
            //smoothiePicture
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(imageName),
            ),
            //smoothieText
            Text(smoothieFlavor, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20)
            ),
            SizedBox(
              height: 4,
            ),
            //TODO: agregar texto de la tienda
            Text(smoothieStore, style: TextStyle(
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
                      addToCart(smoothieFlavor, double.parse(smoothiePrice));
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