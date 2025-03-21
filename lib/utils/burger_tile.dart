import 'package:flutter/material.dart';

class BurgerTile extends StatelessWidget {
  final String burgerFlavor;
  final String burgerPrice;
  final MaterialColor burger;
  final String imageName;
  final String burgerStore;
  final Function(String, double) addToCart;

  const BurgerTile({super.key, required this.burgerFlavor, required this.burgerStore, required this.burgerPrice, required this.imageName, required this.burger, required this.addToCart});

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color:burger[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            //PriceTag
            Row(
              //Alinea a la derecha

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: burger[200],
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
                    '\$$burgerPrice', 
                    style: TextStyle(
                      fontWeight:FontWeight.bold, 
                      fontSize: 18,
                      color: burger[800]
                    )
                  )
                )
              ],
            ),
            //burgerPicture
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(imageName),
            ),
            //burgerText
            Text(burgerFlavor, style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20)
            ),
            SizedBox(
              height: 4,
            ),
            //TODO: agregar texto de la tienda
            Text(burgerStore, style: TextStyle(
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
                      addToCart(burgerFlavor, double.parse(burgerPrice));
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
