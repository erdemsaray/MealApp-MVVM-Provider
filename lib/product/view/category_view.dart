import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_card_widget.dart';
import '../view_model/category_view_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: context.watch<CategoryViewModel>().state == CategoryState.busy
          ? buildLoadingWidget()
          : context.watch<CategoryViewModel>().state == CategoryState.error
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
        itemCount: context.read<CategoryViewModel>().categories.length,
        itemBuilder: (context, index) => buildListItem(context, index),
      ),
    );
  }

  Widget buildListItem(BuildContext context, int index) {
    final categoryItem = context.read<CategoryViewModel>().categories[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Provider.of<CategoryViewModel>(context, listen: false).clickedCard(context, categoryItem.strCategory);
        },
        child: CustomCardWidget(
          title: categoryItem.strCategory ?? '',
          imageLink: categoryItem.strCategoryThumb ?? '',
        ),
      ),
    );
  }
}
