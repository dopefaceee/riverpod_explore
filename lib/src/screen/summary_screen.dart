import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_explore/src/providers/pizza_provider.dart';

class SummaryScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final cart = useProvider(cartProvider.state);

    return Scaffold(
      appBar: AppBar(
        title: Text('Summary Screen'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            for (var i = 0; i < cart.length; i++) ...[
              ListTile(
                title: Text('${cart[i].name}'),
                subtitle: Text('\$${cart[i].price}'),
                trailing: Text('${cart[i].toppings[0].name}'),
                leading: Container(
                  height: 45,
                  width: 45,
                  color: Colors.black,
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
