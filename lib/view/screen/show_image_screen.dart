import 'dart:io';

import 'package:flutter/material.dart';

class ShowImageScreen extends StatelessWidget {
  const ShowImageScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
              tag: 'imageHero',
              child: Image.file(
                File(imageUrl),
              )),
        ),
      ),
    );
  }
}
