import 'package:flutter/material.dart';

import 'custom_search_field.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Column(
        children: [
          CustomSearchField(
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

