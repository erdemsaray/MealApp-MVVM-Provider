import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product/view/category_view.dart';
import 'product/view_model/category_view_model.dart';
import 'product/view_model/meals_view_model.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => CategoryViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => MealsViewModel(),
      )
    ], child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Material App', theme: ThemeData.dark(), home: const CategoryView());
  }
}
