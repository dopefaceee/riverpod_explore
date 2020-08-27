import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explore/src/models/pizza.dart';
import 'package:riverpod_explore/src/models/topping.dart';
import 'package:riverpod_explore/src/notifiers/pizza_notifier.dart';

final pizzaListProvider = StateNotifierProvider((ref) {
  return PizzaList([
    Pizza(name: 'Neapolitan', price: 2.99, toppings: []),
    Pizza(name: 'Sicilian', price: 1.99, toppings: []),
    Pizza(name: 'New-york Style', price: 3.99, toppings: []),
    Pizza(name: 'Kebab', price: 2.99, toppings: [])
  ]);
});

final toppingListProvider = StateNotifierProvider((ref) {
  return ToppingList([
    Topping(name: 'Bacon', price: 0.99),
    Topping(name: 'Cheese', price: 0.99),
    Topping(name: 'Chicken Pop', price: 1.99),
  ]);
});

final cartProvider = StateNotifierProvider((ref) {
  return Cart([]);
});
