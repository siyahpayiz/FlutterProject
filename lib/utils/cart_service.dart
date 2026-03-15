import 'package:flutter/material.dart';
import '../models/product.dart';

class CartService {

  // ürün -> adet
  static Map<Product, int> cartItems = {};

  static ValueNotifier<int> cartCount = ValueNotifier(0);

  static void addToCart(Product product) {

    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }

    updateCount();
  }

  static void removeFromCart(Product product) {

    if (!cartItems.containsKey(product)) return;

    if (cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
    } else {
      cartItems.remove(product);
    }

    updateCount();
  }

  static void updateCount() {
    int total = 0;

    for (var qty in cartItems.values) {
      total += qty;
    }

    cartCount.value = total;
  }
}