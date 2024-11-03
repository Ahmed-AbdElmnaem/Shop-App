import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextSearch extends StatelessWidget {
  const AppTextSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'ابحث عن منتجاتك',
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(16),
          hintStyle: TextStyle(fontSize: 16),
          labelStyle: TextStyle(fontSize: 16),
          errorStyle: TextStyle(fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
        ),
      ),
    );
  }
}
