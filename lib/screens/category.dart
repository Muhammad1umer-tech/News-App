import 'package:flutter/material.dart';

import '../helper/category.dart';
import '../models/ArticlesModel.dart';
import '../widgets/BlockTile.dart';

class Category_News extends StatefulWidget {
  static const routename = '/Category_News';
  final String cate;
  Category_News(this.cate);
  @override
  State<Category_News> createState() => _Category_NewsState();
}

class _Category_NewsState extends State<Category_News> {
  bool _loading = false;
  List<ArticlesModel> articles = [];
  void initState() {
    super.initState();
    getcatNews();
  }

  void getcatNews() async {
    Category_news news = Category_news();
    articles = await news.geCategory_newst(widget.cate);
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0.0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.safety_check)),
          )
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
                            articles[index].URL);
                      },
                    ),
                  )
                ],
              )),
            ),
    );
  }
}
