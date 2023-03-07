import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/ArticlesModel.dart';
import 'package:http/http.dart' as http;

class News {
  Future<List<ArticlesModel>> getNews() async {
    List<ArticlesModel> news = [];
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=3095c28afc85411db9aecbc3c51497db";

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
            news.add(article);
          }
        },
      );
    } else {
      print(jsonData['status']);
    }
    return news;
  }
}

// class Category_news {
//   List<ArticlesModel> news = [];

//   Future<void> getNews(String Category) async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?category=$Category&apiKey=3095c28afc85411db9aecbc3c51497db";

//     var response = await http.get(url);

//     var jsonData = jsonDecode(response.body);

//     if (jsonData['status'] == "ok") {}
//     print(news.length);
//     print("category_news.length");
//   }
// }
