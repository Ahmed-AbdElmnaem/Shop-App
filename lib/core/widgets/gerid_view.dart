import 'package:flutter/material.dart';
import 'package:tahadoapp/ui/home/widgets/custom_card%20.dart';

class GeridViewCustom extends StatelessWidget {
  final int? crossAxisCount;
  final bool scrollDirection;
  final int itemCount;

  const GeridViewCustom({
    super.key,
    required this.crossAxisCount,
    this.scrollDirection = false,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      // لجعل الشبكة تتكيف مع المساحة المتاحة
      scrollDirection: scrollDirection ? Axis.vertical : Axis.horizontal,
      // تحديد التمرير ليكون بالعرض
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 255,
        //childAspectRatio: 16 / 4,
      ),
      itemCount: itemCount, // عدد العناصر المعروضة
      itemBuilder: (context, index) {
        return  SizedBox();
      },
    );
  }
}
