import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_explore/src/network/api_manager.dart';
import 'package:riverpod_explore/src/network/api_request.dart';
import 'package:riverpod_explore/src/network/endpoints.dart';
import 'package:riverpod_explore/src/screen/counter_screen.dart';
import 'package:riverpod_explore/src/screen/op_screen.dart';
import 'package:riverpod_explore/src/screen/order_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              child: Text('Counter'),
              color: Colors.blue[300],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CounterScreen()),
                );
              },
            ),
            MaterialButton(
              child: Text('Order Pizza'),
              color: Colors.purple[300],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderScreen()),
                );
              },
            ),
            MaterialButton(
              child: Text('One Piece'),
              color: Colors.red[300],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OPScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
