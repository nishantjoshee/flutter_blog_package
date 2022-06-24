import 'package:flutter/material.dart';

class BlogPackage extends StatefulWidget {
  const BlogPackage({Key? key}) : super(key: key);

  @override
  State<BlogPackage> createState() => _ClassNameState();
}

class _ClassNameState extends State<BlogPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
