import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  // Lista de donas
  final List donutsOnSale = [
    // [donutFlavor, donutPrice, donutColor, imageName]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    //Cuadrícula
    return GridView.builder(
      //Cuántos elementos hay en nuestra lista
        itemCount: donutsOnSale.length,
        padding: const EdgeInsets.all(8.0),
        //Organiza los elementos en una cuadricula
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // Número de columnas
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutPrice: donutsOnSale[index][1],
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
          );
        },
      );
  }
}

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final Color donutColor;
  final String imageName;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: donutColor.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageName, height: 80, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              donutFlavor,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              "\$$donutPrice",
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
