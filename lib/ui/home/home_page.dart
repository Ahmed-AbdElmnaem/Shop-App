import 'package:flutter/material.dart';
import 'package:tahadoapp/core/theming/color_manger.dart';
import 'package:tahadoapp/core/widgets/Carouse_Slider_custom.dart';
import 'package:tahadoapp/core/widgets/app_appbar.dart';
import 'package:tahadoapp/core/widgets/app_text_search.dart';
import 'package:tahadoapp/ui/home/widgets/categroy_item.dart';
import 'package:tahadoapp/core/widgets/custom_card%20.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.mainColor,
      appBar: const AppAppbar(title: "Home"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Make Column take minimum space
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const CategroyItem(),
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
