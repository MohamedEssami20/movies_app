import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/data/models/categories_model.dart';
import 'package:movies_app/features/home/presentation/manager/categories_items/categories_items_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/categorie_item.dart';

class CategoriesItemListView extends StatelessWidget {
  const CategoriesItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesItemsCubit, int>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: CategoriesModel.categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {
                  context.read<CategoriesItemsCubit>().changeIndex(index);
                },
                child: CategorieItem(
                  categoriesModel: CategoriesModel.categories[index],
                  isSelected: index == state,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
