import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahadoapp/logic/app_cubit/app_cubit.dart';

class CarouseSliderCustom extends StatelessWidget {
  const CarouseSliderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return BuildCondition(
        condition: state is! GetbannerslodingState &&
            context.read<AppCubit>().bannersModel != null,
        builder: (context) => CarouselSlider(
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
          items: context
              .read<AppCubit>()
              .bannersModel!
              .data!
              .map((item) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      image: DecorationImage(
                        image: NetworkImage(item.image ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
              .toList(),
        ),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
