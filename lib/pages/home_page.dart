import 'package:donut_app_2b_luis_vera/Tabs/burger_tab.dart';
import 'package:donut_app_2b_luis_vera/Tabs/donut_tab.dart';
import 'package:donut_app_2b_luis_vera/Tabs/pancakes_tab.dart';
import 'package:donut_app_2b_luis_vera/Tabs/pizza_tab.dart';
import 'package:donut_app_2b_luis_vera/Tabs/smoothie_tab.dart';
import 'package:donut_app_2b_luis_vera/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Lista de Tabs
  List<Widget>  myTabs=[
    MyTab(iconPath: 'lib/icons/donut.png'),
    MyTab(iconPath: 'lib/icons/burger.png'),
    MyTab(iconPath: 'lib/icons/smoothie.png'),
    MyTab(iconPath: 'lib/icons/pancakes.png'),
    MyTab(iconPath: 'lib/icons/pizza.png'),
  ];

  // Estado del carrito
  List<Map<String, dynamic>> cartItems = []; // Lista de elementos en el carrito
  double totalPrice = 0.0; // Precio total

  // Función para agregar un elemento al carrito
  void addToCart(String name, double price) {
    setState(() {
      cartItems.add({"name": name, "price": price});
      totalPrice += price;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //icono izq
          leading: Icon(
            Icons.menu,
          color:Colors.grey[850],
          ),
        //icono derecho
          actions: const[
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
       
        ),
        body:Column(children:[
          //Texto principal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            child: Row(
              children: [
                Text("I want to ", style: TextStyle(fontSize: 32)),
                Text("Eat", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, decoration: TextDecoration.underline))//Tamañ
              ],
            ),
          ),
      
          //TabBar
          TabBar(tabs: myTabs),


          //TabBarView
          Expanded(
            child: TabBarView(children:[
            DonutTab(addToCart: addToCart),
            BurgerTab(addToCart: addToCart),
            SmoothieTab(addToCart: addToCart),
            PancakesTab(addToCart: addToCart),
            PizzaTab(addToCart: addToCart),
              ] 
            ),
          ),
          
          
                
          //Carrito
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Row(
                  //Poner los elementos en los extremos de la fila
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${cartItems.length} items | \$${totalPrice.toStringAsFixed(2)}", 
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                          ),                    
                        ),
                        Text("Delivery Charges Included",
                        style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[200],
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12
                        )
                      ),
                          child: Text('View Cart', 
                          style: TextStyle(color: Colors.black)
                    )
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}