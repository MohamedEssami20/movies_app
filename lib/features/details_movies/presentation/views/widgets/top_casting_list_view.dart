import 'package:flutter/material.dart';

import 'top_cast_items.dart';

class TopCastingListView extends StatelessWidget {
  const TopCastingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12),
            child: TopCastItems(),
          );
        },
      ),
    );
  }
}
