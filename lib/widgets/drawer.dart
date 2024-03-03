import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelectedScreen});

  final void Function(String identifier) onSelectedScreen;

  @override
  Widget build(context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.8)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood_outlined,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Cooking Up!",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary)
                  )
                ],
              ),
              ),
              ListTile(
                leading: Icon(Icons.restaurant, size: 25, color: Theme.of(context).colorScheme.onBackground,),
                title: Text("Meal",style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.onBackground)
                 ,),
                 onTap: (){
                  onSelectedScreen('meals');
                 },
              ),
              ListTile(
                leading: Icon(Icons.settings, size: 25, color: Theme.of(context).colorScheme.onBackground,),
                title: Text("Filters",style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.onBackground)
                 ,),
                 onTap: (){
                  onSelectedScreen('filters');
                 },
              ),
              ListTile(
                leading: Icon(Icons.search, size: 25, color: Theme.of(context).colorScheme.onBackground,),
                title: Text("Search",style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.onBackground)
                 ,),
                 onTap: (){
                  onSelectedScreen('search');
                 },
              ),
              ListTile(
                leading: Icon(Icons.history, size: 25, color: Theme.of(context).colorScheme.onBackground,),
                title: Text("History",style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.onBackground)
                 ,),
                 onTap: (){
                  onSelectedScreen('history');
                 },
              ),
              ListTile(
                leading: Icon(Icons.visibility, size: 25, color: Theme.of(context).colorScheme.onBackground,),
                title: Text("Frequently Viewed",style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.onBackground)
                 ,),
                 onTap: (){
                  onSelectedScreen('frequent-item');
                 },
              ),
              
        ],
      ),
    );
  }
}
