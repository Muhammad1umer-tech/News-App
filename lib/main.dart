import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/models/ArticlesModel.dart';
import 'package:flutter_complete_guide/screens/articles_view.dart';
import 'package:flutter_complete_guide/screens/category.dart';
import 'screens/home.dart';
import 'helper/news.dart';

import './screens/articles_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "New Project",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Raleway',
      ),
      home: Home(),
    );
  }
}
