import 'package:riverpod_explore/src/models/pizza.dart';
import 'package:riverpod_explore/src/models/topping.dart';
import 'package:state_notifier/state_notifier.dart';

class PizzaList extends StateNotifier<List<Pizza>> {
  PizzaList(List<Pizza> initialPizza) : super(initialPizza ?? []);
}

class ToppingList extends StateNotifier<List<Topping>> {
  ToppingList(List<Topping> initialTopping) : super(initialTopping ?? []);
}

class Cart extends StateNotifier<List<Pizza>> {
  Cart(List<Pizza> initialCart) : super(initialCart ?? []);

  void add(Pizza pizza, Topping topping) {
    state = [
      ...state,
      Pizza(name: pizza.name, price: pizza.price, toppings: [topping]),
    ];
  }
}
