import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_explore/src/models/pizza.dart';
import 'package:riverpod_explore/src/models/topping.dart';
import 'package:riverpod_explore/src/providers/pizza_provider.dart';
import 'package:riverpod_explore/src/screen/summary_screen.dart';

class OrderScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final pizzaList = useProvider(pizzaListProvider.state);
    final cart = useProvider(cartProvider.state);
    final toppingList = useProvider(toppingListProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Pizza'),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SummaryScreen()),
                  );
                },
              ),
              Positioned(
                left: 5,
                top: 5,
                child: Container(
                    child: Center(
                      child: Text(
                        '${cart.length}',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    width: 17,
                    height: 17,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    )),
              ),
            ],
          )
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          for (var i = 0; i < pizzaList.length; i++) ...[
            ListTile(
              title: Text('${pizzaList[i].name}'),
              subtitle: Text('\$${pizzaList[i].price}'),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  displayBottomSheet(context, pizzaList[i], toppingList);
                },
              ),
              leading: Container(
                height: 45,
                width: 45,
                color: Colors.black,
              ),
            )
          ],
        ],
      )),
    );
  }

  void displayBottomSheet(
      BuildContext context, Pizza pizza, List<Topping> toppingList) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          child: Column(
            children: <Widget>[
              for (var i = 0; i < toppingList.length; i++) ...[
                ListTile(
                  title: Text('${toppingList[i].name}'),
                  subtitle: Text('\$${toppingList[i].price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      context.read(cartProvider).add(pizza, toppingList[i]);
                    },
                  ),
                  leading: Container(
                    height: 45,
                    width: 45,
                    color: Colors.yellow[i * 100],
                  ),
                )
              ],
            ],
          ),
        );
      },
    );
  }
}
