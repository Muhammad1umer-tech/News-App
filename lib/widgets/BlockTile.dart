import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/helper/data.dart';
import 'package:flutter_complete_guide/helper/news.dart';
import 'package:flutter_complete_guide/models/ArticlesModel.dart';
import 'package:flutter_complete_guide/models/category_model.dart';
import 'package:flutter_complete_guide/screens/articles_view.dart';

class BlockTile extends StatelessWidget {
  final String imageURL;
  final String title;
  final String desc;
  final String url;
  BlockTile(this.imageURL, this.title, this.desc, this.url);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlesView(url),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageURL)),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              desc,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
