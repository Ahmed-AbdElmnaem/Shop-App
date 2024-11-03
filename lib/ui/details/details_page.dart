import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahadoapp/core/widgets/app_appbar.dart';
import 'package:tahadoapp/logic/app_cubit/app_cubit.dart';
import 'package:tahadoapp/model/prodcuts_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.model});

  final Products model;

  @override
  _DetailsPage createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar:  AppAppbar(title: "details", 

           
           ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12.0),
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            height: 300.0,
                            enlargeFactor: 0.3,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            pauseAutoPlayOnTouch: true,
                            aspectRatio: 2.0,
                          ),
                          items: widget.model.images!
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
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              widget.model.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.model.description ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.model.oldPrice.toString() ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${widget.model.discount}%',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.model.price.toString() ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shopping_cart,
                                        color: Colors.black87),
                                    iconSize: 24,
                                    padding: EdgeInsets.zero),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 24,
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
