import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_card_widget.dart';
import '../view_model/meals_view_model.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({super.key});

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
    return SafeArea(
      child: ListView.builder(
        itemCount: context.read<MealsViewModel>().mealsList.length,
        itemBuilder: (context, index) => buildListItem(context, index),
      ),
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    final mealsListItem = context.read<MealsViewModel>().mealsList[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: CustomCardWidget(
          title: mealsListItem.strMeal ?? '',
          imageLink: mealsListItem.strMealThumb ?? '',
        ),
      ),
    );
  }
}
