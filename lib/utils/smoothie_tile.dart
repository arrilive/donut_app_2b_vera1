import 'package:flutter/material.dart';
 
class SmoothieTile extends StatelessWidget {
  final String smoothieFlavor;
  final String smoothieStore;
  final String smoothiePrice;
  final dynamic smoothieColor;
  final String imageName;
 
  const SmoothieTile({super.key, required this.smoothieFlavor, required this.smoothieStore, required this.smoothiePrice, this.smoothieColor, required this.imageName});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color:smoothieColor[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            //PriceTag
            Row(
              //Alinea a la derecha
 
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: smoothieColor[200],
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
                    color:smoothieColor[800]
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
            Text(smoothieFlavor, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            //Para tener espacio entre el texto y el boton
            const SizedBox(
              height: 4,
            ),
            //smoothieStore
              Text(smoothieStore, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            
            //LoveIcon + AddButton 
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border,
                  color: Colors.pink[400],
                  ),
                  const Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                    ),
                ],
              ),
              )
          ],
        )
      ),
    );
  }
}