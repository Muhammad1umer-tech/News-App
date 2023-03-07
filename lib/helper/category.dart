import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/ArticlesModel.dart';
import 'package:http/http.dart' as http;

class Category_news {
  Future<List<ArticlesModel>> geCategory_newst(String cate) async {
    List<ArticlesModel> cat_news = [];
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=${cate}&apiKey=1daf34b622844488b1561b8ba68d575f");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticlesModel article = ArticlesModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              UrlToImage: element['urlToImage'],
              Content: element["content"],
              URL: element["url"],
            );
            cat_news.add(article);
          }
        },
      );
      return cat_news;
    }
  }
}
