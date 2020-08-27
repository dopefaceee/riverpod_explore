import 'package:state_notifier/state_notifier.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;
  void decrement() {
    if (state <= 0) {
      state = 0;
    } else {
      state--;
    }
  }
}
