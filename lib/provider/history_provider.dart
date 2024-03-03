import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';

class HistoryNotifier extends StateNotifier<List<Meal>>{

  HistoryNotifier() : super([]);

  void toggleHistory(Meal meal){
    state = [meal,...state];
    meal.timeStored = DateTime.now();
  }
}

final historyProvider = StateNotifierProvider<HistoryNotifier , List<Meal>>((ref) {
  return HistoryNotifier();
},);