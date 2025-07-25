import 'package:flutter/material.dart';
import 'package:donut_app_2b_luis_vera/models/product.dart';
import 'package:donut_app_2b_luis_vera/models/category.dart';
import 'package:donut_app_2b_luis_vera/services/product_service.dart';

class SuperMarketPage extends StatefulWidget {
  const SuperMarketPage({super.key});

  @override
  State<SuperMarketPage> createState() => _SuperMarketPageState();
}

class _SuperMarketPageState extends State<SuperMarketPage> {
  List<Product> products = []; //Inicializa la lista productos
  bool isLoading = true; //Barra carga
  int? selectedCategoryId; //Para buscar productos por categoría

  @override
  void initState() {
    super.initState();
    loadProducts(); // Por defecto carga todos
  }

  Future<void> loadProducts({int? categoryId}) async {
    setState(() {
      isLoading = true;
    });
    try {
      final fetchedProducts = categoryId == null
          ? await ProductService.getAllProducts()
          : await ProductService.getProductsByCategory(categoryId);
      setState(() {
        products = fetchedProducts;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        products = [];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildDropdown() {
    return DropdownButton<int>(
      hint: const Text("Selecciona categoría"),
      value: selectedCategoryId,
      onChanged: (value) {
        setState(() {
          selectedCategoryId = value;
        });
        loadProducts(categoryId: value);
      },
      items: categories.map((cat) {
        return DropdownMenuItem<int>(
          value: cat.id,
          child: Text(cat.name),
        );
      }).toList(),
    );
  }

  Widget buildProductCard(Product product) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text("Precio: \$${product.price} | Stock: ${product.stock}"),
        trailing: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SuperMarket'),
        backgroundColor: const Color.fromARGB(255, 218, 113, 148),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: buildDropdown(),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : products.isEmpty
                    ? const Center(child: Text("No hay productos"))
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) =>
                            buildProductCard(products[index]),
                      ),
          ),
        ],
      ),
    );
  }
}