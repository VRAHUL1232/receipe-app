import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/provider/history_provider.dart';
import 'package:meals_app/screens/meal.details.dart';
import 'package:timeago/timeago.dart' as timeago;

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({
    super.key,
  });

  Widget build(BuildContext context, WidgetRef ref) {

    List<Meal> historyMeals = ref.watch(historyProvider);

    void _onPressedMeal(int index, Meal meal) {
      Future.delayed(
        const Duration(milliseconds: 200),
        () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MealDetails(meal: meal),
          ));
        },
      );
    }

    Widget _timeAgoMeals(int index) {
      final timestoredMeal = historyMeals[index].timeStored;
      final timeAgoMeal = timeago.format(timestoredMeal!);
      return Text(timeAgoMeal,style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),);
    }

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 18,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: historyMeals.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      onTap: () {
                        _onPressedMeal(index, historyMeals[index]);
                      },
                      title: Text(historyMeals[index].name,),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                          children: [
                            Icon(Icons.history ,size: 14,color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),),
                            SizedBox(width: 4,),
                            _timeAgoMeals(index),
                          ],
                        ),
                      ),
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(2.5),
                          child: Image.asset(
                            historyMeals[index].imageUrl,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          )),
                      trailing: Text(historyMeals[index].speciality.name),
                    ),
                  )),
        ),
      ],
    );

    if (historyMeals.isEmpty) {
      content = Center(
        child: Text("No search history found...",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: content,
    );
  }
}
