import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:tahadoapp/model/catogry_model.dart';

class CategroyItem extends StatelessWidget {
  CategroyItem({super.key});
  List<CatogryModel> categories = [
    CatogryModel(
        image:
            'https://johngress.com/wp-content/uploads//2023/08/Chicago-Fashion-Photographer-for-Male-Models-Kenneth-0666.jpg',
        name: 'man'),
    CatogryModel(
        image:
            'https://models.bestmodelsagency.com/recursos/clientes/24546B3E-8397-4238-A5BF-001BE3E4E1D7/list.jpg?v1670601655?202410081559',
        name: 'woman'),
    CatogryModel(
        image:
            'https://5.imimg.com/data5/DZ/OD/YX/IOS-98785981/product-jpeg-500x500.png',
        name: 'shose'),
    CatogryModel(
        image:
            'https://rukminim2.flixcart.com/image/850/1000/xif0q/sling-bag/p/d/g/-original-imagggj86dmv4vhz.jpeg?q=90&crop=false',
        name: 'bag'),
    CatogryModel(
        image:
            'https://citygirlgonemom.com/wp-content/uploads/2016/05/IMG_7213.jpg',
        name: 'kids'),
    CatogryModel(
        image:
            'https://designerseducation.com/wp-content/uploads/2024/02/accessories.jpg',
        name: 'accessories'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal, // لو عايز التمرير أفقي
      itemCount: categories.length, // عدد العناصر اللي عايز تعرضها
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print(categories[index]); // هنا بنطبع العنصر المختار
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  backgroundImage: NetworkImage(categories[index].image),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    categories[index].name, // اسم الفئة حسب `categories`
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
