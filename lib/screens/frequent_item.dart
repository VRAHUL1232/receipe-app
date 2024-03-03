import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/provider/history_provider.dart';
import 'package:meals_app/screens/meal.details.dart';

class FrequentScreen extends ConsumerWidget {
  const FrequentScreen({
    super.key,
  });

  @override
  Widget build(context, WidgetRef ref) {
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

    List<Meal> frequentMeals = [];
    for (final meal in historyMeals) {
      if (!frequentMeals.contains(meal) && meal.frequentMeal > 1) {
        frequentMeals.add(meal);
      }
    }
    frequentMeals.sort(
      (a, b) => b.frequentMeal.compareTo(a.frequentMeal),
    );

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 18,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: frequentMeals.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      onTap: () {
                        _onPressedMeal(index, frequentMeals[index]);
                      },
                      title: Text(frequentMeals[index].name),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            Icon(Icons.visibility,size: 14,color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),),
                            SizedBox(width: 4,),
                            Text(
                                "Viewed " + frequentMeals[index].frequentMeal.toString() + " times",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.5))),
                          ],
                        ),
                      ),
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(2.5),
                          child: Image.asset(
                            frequentMeals[index].imageUrl,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          )),
                      trailing: Text(frequentMeals[index].speciality.name),
                    ),
                  )),
        ),
      ],
    );

    if (frequentMeals.isEmpty) {
      content = Center(
        child: Text("No such frequent meals found...",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Frequently Viewed"),
      ),
      body: content,
    );
  }
}
