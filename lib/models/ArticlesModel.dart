import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ArticlesModel {
  String author;
  String title;
  String description;
  String URL;
  String UrlToImage;
  String Content;
  String PublishData;
  String flag;

  ArticlesModel(
      {this.author,
      this.title,
      this.description,
      this.URL,
      this.UrlToImage,
      this.Content,
      this.PublishData,
      this.flag});
}
