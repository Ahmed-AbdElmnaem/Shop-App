import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tahadoapp/core/widgets/Carouse_Slider_custom.dart';
import 'package:tahadoapp/core/widgets/app_text_form_field.dart';
import 'package:tahadoapp/core/widgets/app_text_search.dart';
import 'package:tahadoapp/core/widgets/bottom_app_bar.dart';
import 'package:tahadoapp/core/widgets/categroy_item.dart';
import 'package:tahadoapp/core/widgets/custom_card%20.dart';
import 'package:tahadoapp/core/widgets/gerid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F4E79),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Make Column take minimum space
          children: [
            const SizedBox(height: 25),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Color(0xFF1F4E79),
                    ),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'مرحبا!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: AppTextSearch(),
            ),
            const SizedBox(height: 10),
            SizedBox(height: 130, child: CategroyItem()),
            const CarouseSliderCustom(),
            const Align(
              alignment: Alignment.centerRight, // المحاذاة إلى اليمين
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text('عرض الكل',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Spacer(),
                    Text(
                      'منتجاتنا',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 280.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => const CustomCard(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
