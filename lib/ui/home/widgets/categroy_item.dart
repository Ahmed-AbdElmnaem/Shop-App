import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahadoapp/logic/app_cubit/app_cubit.dart';
import 'package:tahadoapp/model/catogry_model.dart';

class CategroyItem extends StatelessWidget {
  const CategroyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is GetCategorySuccessState) {
          return SizedBox(
            height: 130.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // لو عايز التمرير أفقي
              itemCount: state.categoryModel.data!.data!
                  .length, // عدد العناصر اللي عايز تعرضها
              itemBuilder: (context, index) {
                return categoryItem(
                  index,
                  context,
                  state.categoryModel.data!.data![index],
                );
              },
            ),
          );
        } else if (state is GetCategoryErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }

  GestureDetector categoryItem(int index, context, CatogryData model) {
    return GestureDetector(
      onTap: () {
        //print(categories[index]); // هنا بنطبع العنصر المختار
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              backgroundImage: NetworkImage(model.image ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.name ?? "", // اسم الفئة حسب `categories`
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
  }
}
