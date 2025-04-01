import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/categorie_item.dart';

class CategoriesItemListView extends StatefulWidget {
  const CategoriesItemListView({super.key});

  @override
  State<CategoriesItemListView> createState() => _CategoriesItemListViewState();
}

class _CategoriesItemListViewState extends State<CategoriesItemListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: CategorieItem(
              title: "All Categories",
              icon: Icons.category,
              isSelected: index == currentIndex,
            ),
          ),
        );
      },
    );
  }
}
