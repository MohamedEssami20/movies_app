
import 'package:flutter/material.dart';
import 'package:movies_app/features/search/presentation/widgets/search_item.dart' show SearchItems;

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: SizedBox(
        height: screenHeight < 650 ? screenHeight * 0.61 : screenHeight * 0.65,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: const SearchItems(),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

