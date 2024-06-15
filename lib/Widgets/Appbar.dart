import 'package:flutter/material.dart';
import '../resources/Color.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(
          title,
          style: TextStyle(color: colorConstant.Textcolor),
        ),
        centerTitle: true,
      );
}
