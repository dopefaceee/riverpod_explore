import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explore/src/notifiers/counter_notifier.dart';

final counterProvider = StateNotifierProvider((ref) => CounterNotifier());
