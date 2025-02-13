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
          TabBar(tabs: myTabs)
          //TabBarView
      
          //Carrito
        ],)
      ),
    );
  }
}