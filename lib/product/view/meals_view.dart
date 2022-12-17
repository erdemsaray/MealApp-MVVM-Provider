import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/meals_view_model.dart';
import '../view_model/recipe_details_view_model.dart';
import '../widgets/recipes_card_widget.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Recipes"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: context.watch<MealsViewModel>().state == MealsState.busy
          ? buildLoadingWidget()
          : context.watch<MealsViewModel>().state == MealsState.error
              ? buildErrorWidget()
              : buildListWidget(context),
    );
  }

  Widget buildLoadingWidget() => const Center(child: CircularProgressIndicator());

  Widget buildErrorWidget() => const Center(
        child: Text("Something went wrong"),
      );

  Widget buildListWidget(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: ListView.builder(
          itemCount: context.read<MealsViewModel>().mealsList.length,
          itemBuilder: (context, index) => buildListItem(context, index),
        ),
      ),
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    final mealsListItem = context.read<MealsViewModel>().mealsList[index];
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          Provider.of<RecipeDetailsModel>(context, listen: false).changeRecipeID(mealsListItem.idMeal);
          Provider.of<MealsViewModel>(context, listen: false).clickedCard(context);
        },
        child: RecipesCardWidget(
          title: mealsListItem.strMeal ?? '',
          imageLink: mealsListItem.strMealThumb ?? '',
        ),
      ),
    );
  }
}
