import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouseSliderCustom extends StatelessWidget {
  const CarouseSliderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    List images = [
      "https://m.media-amazon.com/images/I/51CSzAMBHOL._AC_UF894,1000_QL80_.jpg",
      "https://miro.medium.com/v2/resize:fit:633/1*kJMLSOKEH8fcKjVkDfx_iw.jpeg",
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 2.0,
      ),
      items: images
          .map((item) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  image: DecorationImage(
                    image: NetworkImage(item),
                    fit: BoxFit.cover,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
