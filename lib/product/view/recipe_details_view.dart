import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/recipe_details_view_model.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: context.watch<RecipeDetailsModel>().state == DetailsState.busy
            ? const CircularProgressIndicator()
            : context.watch<RecipeDetailsModel>().state == DetailsState.error
                ? buildErrorWidget()
                : buildPageBody(context));
  }

  Widget buildErrorWidget() => const Center(
        child: Text("Something went wrong"),
      );

  Widget buildPageBody(context) {
    final meal = Provider.of<RecipeDetailsModel>(context).mealsList.first;
    return Container(
      color: const Color.fromARGB(255, 34, 33, 33),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image(
                image: NetworkImage("${meal.strMealThumb}"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
                child: Column(
                  children: [
                    Text(
                      meal.strMeal ?? '',
                      style: const TextStyle(fontSize: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 9,
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Text(
                      "${meal.strInstructions}",
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
