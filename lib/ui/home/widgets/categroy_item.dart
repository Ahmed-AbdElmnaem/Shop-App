import 'package:buildcondition/buildcondition.dart';
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
        return BuildCondition(
          condition: state is! GetCategoryLoadingState &&
              context.read<AppCubit>().categoryModel != null,
          builder: (context) => SizedBox(
            height: 130.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // لو عايز التمرير أفقي
              itemCount: context
                  .read<AppCubit>()
                  .categoryModel!
                  .data!
                  .data!
                  .length, // عدد العناصر اللي عايز تعرضها
              itemBuilder: (context, index) {
                return categoryItem(
                  index,
                  context,
                  context.read<AppCubit>().categoryModel!.data!.data![index],
                );
              },
            ),
          ),
          fallback: (context) => state is GetCategoryErrorState
              ? Text(state.error.toString())
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  GestureDetector categoryItem(int index, context, CatogryData model) {
    return GestureDetector(
      onTap: () {
        //print(categories[index]); // هنا بنطبع العنصر المختار
      },
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
            child: SizedBox(
              width: 80,
              child: Text(
                model.name ?? "", // اسم الفئة حسب `categories`
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
