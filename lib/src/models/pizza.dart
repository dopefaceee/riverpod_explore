import 'package:riverpod_explore/src/models/topping.dart';

class Pizza {
  String name;
  double price;
  List<Topping> toppings;

  Pizza({this.name, this.price, this.toppings});
}
