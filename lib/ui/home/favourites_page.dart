import 'package:flutter/material.dart';
import 'package:tahadoapp/core/widgets/app_text_search.dart';
import 'package:tahadoapp/core/widgets/gerid_view.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF1F4E79),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              AppTextSearch(),
              Expanded(
                child: GeridViewCustom(
                  itemCount: 20,
                  scrollDirection: true,
                  crossAxisCount: 2,
                ),
              ),
            ],
          ),
        ));
  }
}
