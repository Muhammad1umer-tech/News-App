import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../helper/data.dart';
import '../helper/news.dart';
import '/models/ArticlesModel.dart';
import '/models/category_model.dart';
import '/widgets/App_bar_Widget.dart';
import '/screens/articles_view.dart';
import '../widgets/BlockTile.dart';
import '../widgets/CategoryTile.dart';
import 'category.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category_model> category = [];
  List<ArticlesModel> articles = [];
  bool _loading = true;

  void initState() {
    super.initState();
    category = getCategories();
    getNews();
  }

  void getNews() async {
    News news = News();
    articles = await news.getNews();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.white10,
        centerTitle: true,
        elevation: 0.0,
        title: App_bar_Widget(),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
      ),
      body: _loading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    //categories
                    Container(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageURL: category[index].image_url,
                              CategoryName: category[index].Category_name,
                            );
                          }),
                    ),
                    //blog
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlockTile(
                            articles[index].UrlToImage,
                            articles[index].title,
                            articles[index].description,
                            articles[index].URL,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
