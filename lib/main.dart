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
  final String id;
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.id, required this.name, required this.imageUrl, required this.price});
}

final Map<String, List<Product>> categories = {
  'Donuts': [
    Product(id: 'donut1', name: 'Donut de Chocolate', imageUrl: 'assets/img/donnut_chocolate.png', price: 4.99),
    Product(id: 'donut2', name: 'Donut com Morango', imageUrl: 'assets/img/dunnut_morango.png', price: 5.49),
    Product(id: 'donut3', name: 'Donut Nevado', imageUrl: 'assets/img/dunnut_nevado.png', price: 4.99),
    Product(id: 'donut4', name: 'Donut Vanilla', imageUrl: 'assets/img/dunnut.png', price: 5.49),
    Product(id: 'donut5', name: 'Donut de Morango com Nutella', imageUrl: 'assets/img/dunnut_morango_nutella.png', price: 4.99),
    Product(id: 'donut6', name: 'Donut de Pistache', imageUrl: 'assets/img/dunnut_pistache.png', price: 5.49),
    Product(id: 'donut7', name: 'Donut de Chocolate Amargo', imageUrl: 'assets/img/dunnut_chocolate_amargo.png', price: 4.99),
    Product(id: 'donut8', name: 'Donut com Banana', imageUrl: 'assets/img/dunnut_banana.png', price: 5.49),
  ],
  'Bolos': [
    Product(id: 'bolo1', name: 'Bolo de Cenoura', imageUrl: 'assets/img/bolo_cenoura.png', price: 7.99),
    Product(id: 'bolo2', name: 'Bolo de Chocolate', imageUrl: 'assets/img/bolo_chocolate.png', price: 8.99),
    Product(id: 'bolo3', name: 'Brownie', imageUrl: 'assets/img/brownie.png', price: 8.99),
    Product(id: 'bolo4', name: 'Bolo com Castanhas', imageUrl: 'assets/img/bolo_castanha.png', price: 8.99),
    Product(id: 'bolo5', name: 'Bolo Floresta Negra', imageUrl: 'assets/img/bolo_floresta_negra.png', price: 7.99),
    Product(id: 'bolo6', name: 'Bolo de Banana', imageUrl: 'assets/img/bolo_banana.png', price: 8.99),
  ],
  'Bebidas': [
    Product(id: 'bebida1', name: 'Refrigerante Cola - Lata', imageUrl: 'assets/img/refrigerante_cola.png', price: 3.50),
    Product(id: 'bebida2', name: 'Refrigerante Cola Zero - Lata', imageUrl: 'assets/img/refrigerante_cola_zero.png', price: 3.50),
    Product(id: 'bebida3', name: 'Água Mineral sem Gás', imageUrl: 'assets/img/agua.png', price: 2.00),
    Product(id: 'bebida4', name: 'Água Mineral com Gás', imageUrl: 'assets/img/agua_gas.png', price: 3.50),
    Product(id: 'bebida5', name: 'Refrigerante Schweeppes', imageUrl: 'assets/img/schweeppes.png', price: 2.00),
    Product(id: 'bebida6', name: 'Água Mineral saborizada', imageUrl: 'assets/img/agua_saborizada.png', price: 2.00),
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

  // Carrinho de compras
  Map<String, int> cart = {};

  void addToCart(Product product) {
    setState(() {
      cart.update(product.id, (qty) => qty + 1, ifAbsent: () => 1);
    });
  }

  void removeFromCart(Product product) {
    setState(() {
      if (cart.containsKey(product.id)) {
        if (cart[product.id] == 1) {
          cart.remove(product.id);
        } else {
          cart[product.id] = cart[product.id]! - 1;
        }
      }
    });
  }

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
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => CartView(cart: cart),
              );
            },
          )
        ],
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
                      child: Image.asset(p.imageUrl, fit: BoxFit.contain),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text('R\$ ${p.price.toStringAsFixed(2)}'),
                    const SizedBox(height: 4),
                    ElevatedButton(
                      onPressed: () => addToCart(p),
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

class CartView extends StatelessWidget {
  final Map<String, int> cart;

  const CartView({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final List<Product> allProducts = categories.values.expand((list) => list).toList();
    final List<Product> cartProducts = allProducts.where((p) => cart.containsKey(p.id)).toList();

    return ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        final product = cartProducts[index];
        final quantity = cart[product.id]!;
        return ListTile(
          leading: Image.asset(product.imageUrl, width: 40),
          title: Text(product.name),
          subtitle: Text('Quantidade: $quantity'),
          trailing: Text('R\$ ${(product.price * quantity).toStringAsFixed(2)}'),
        );
      },
    );
  }
}
