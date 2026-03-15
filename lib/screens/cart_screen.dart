import 'package:flutter/material.dart';
import '../utils/cart_service.dart';
import '../models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {

    final items = CartService.cartItems.entries.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: items.isEmpty
          ? const Center(child: Text("Cart is empty"))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {

                Product product = items[index].key;
                int qty = items[index].value;

                return ListTile(
                  leading: Image.network(product.image, width: 50),
                  title: Text(product.title),
                  subtitle: Text("\$${product.price}  x  $qty"),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            CartService.removeFromCart(product);
                          });
                        },
                      ),

                      Text(qty.toString()),

                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            CartService.addToCart(product);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}