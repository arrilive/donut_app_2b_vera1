import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor;
  final String imageName;
  final String donutStore;
  final Function(String, double) addToCart;

  const DonutTile({super.key, required this.donutFlavor, required this.donutStore, required this.donutPrice, this.donutColor, required this.imageName, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color:donutColor[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            //PriceTag
            Row(
              //Alinea a la derecha

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: donutColor[200],
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
                    '\$$donutPrice', 
                    style: TextStyle(
                      fontWeight:FontWeight.bold, 
                      fontSize: 18,
                      color: donutColor[800]
                    )
                  )
                )
              ],
            ),
            //DonutPicture
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(imageName),
            ),
            //DonutText
            Text(donutFlavor, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20)
            ),
            SizedBox(
              height: 4,
            ),
            //TODO: agregar texto de la tienda
            Text(donutStore, style: TextStyle(
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
                      addToCart(donutFlavor, double.parse(donutPrice));
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