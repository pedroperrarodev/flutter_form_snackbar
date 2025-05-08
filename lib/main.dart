import 'package:flutter/material.dart';

void main() {
  runApp(const SweetShopApp());
}

class SweetShopApp extends StatelessWidget {
  const SweetShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja de Doces',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

final Map<String, List<Product>> categories = {
  'Donuts': [
    Product(name: 'Donut de Chocolate', imageUrl: 'https://i.imgur.com/5M0p6fG.png', price: 4.99),
    Product(name: 'Donut com Morango', imageUrl: 'https://i.imgur.com/C4FJr4A.png', price: 5.49),
    Product(name: 'Donut de Chocolate', imageUrl: 'https://i.imgur.com/5M0p6fG.png', price: 4.99),
    Product(name: 'Donut com Morango', imageUrl: 'https://i.imgur.com/C4FJr4A.png', price: 5.49),
    Product(name: 'Donut de Chocolate', imageUrl: 'https://i.imgur.com/5M0p6fG.png', price: 4.99),
    Product(name: 'Donut com Morango', imageUrl: 'https://i.imgur.com/C4FJr4A.png', price: 5.49),
    Product(name: 'Donut de Chocolate', imageUrl: 'https://i.imgur.com/5M0p6fG.png', price: 4.99),
    Product(name: 'Donut com Morango', imageUrl: 'https://i.imgur.com/C4FJr4A.png', price: 5.49),
  ],
  'Bolos': [
    Product(name: 'Bolo de Cenoura', imageUrl: 'https://i.imgur.com/YP8kOWi.png', price: 7.99),
    Product(name: 'Bolo de Chocolate', imageUrl: 'https://i.imgur.com/TXY9n63.png', price: 8.99),
    Product(name: 'Bolo de Cenoura', imageUrl: 'https://i.imgur.com/YP8kOWi.png', price: 7.99),
    Product(name: 'Bolo de Chocolate', imageUrl: 'https://i.imgur.com/TXY9n63.png', price: 8.99),
    Product(name: 'Bolo de Cenoura', imageUrl: 'https://i.imgur.com/YP8kOWi.png', price: 7.99),
    Product(name: 'Bolo de Chocolate', imageUrl: 'https://i.imgur.com/TXY9n63.png', price: 8.99),
    Product(name: 'Bolo de Cenoura', imageUrl: 'https://i.imgur.com/YP8kOWi.png', price: 7.99),
    Product(name: 'Bolo de Chocolate', imageUrl: 'https://i.imgur.com/TXY9n63.png', price: 8.99),
  ],
  'Bebidas': [
    Product(name: 'Refrigerante Lata', imageUrl: 'https://i.imgur.com/oW0jrkD.png', price: 3.50),
    Product(name: 'Água Mineral', imageUrl: 'https://i.imgur.com/bZNyvF7.png', price: 2.00),
    Product(name: 'Refrigerante Lata', imageUrl: 'https://i.imgur.com/oW0jrkD.png', price: 3.50),
    Product(name: 'Água Mineral', imageUrl: 'https://i.imgur.com/bZNyvF7.png', price: 2.00),
    Product(name: 'Refrigerante Lata', imageUrl: 'https://i.imgur.com/oW0jrkD.png', price: 3.50),
    Product(name: 'Água Mineral', imageUrl: 'https://i.imgur.com/bZNyvF7.png', price: 2.00),
    Product(name: 'Refrigerante Lata', imageUrl: 'https://i.imgur.com/oW0jrkD.png', price: 3.50),
    Product(name: 'Água Mineral', imageUrl: 'https://i.imgur.com/bZNyvF7.png', price: 2.00),
  ],
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final tabs = ['Donuts', 'Bolos', 'Bebidas'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doces da Neide 🍩'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((tab) {
          final products = categories[tab]!;
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(p.imageUrl, fit: BoxFit.contain),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text('R\$ ${p.price.toStringAsFixed(2)}'),
                    const SizedBox(height: 4),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Adicionar'),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
