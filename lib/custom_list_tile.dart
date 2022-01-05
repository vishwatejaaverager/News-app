import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/articles.dart';

Widget customListTile(Article article) {
  return Container(
    margin: EdgeInsets.all(12.0),
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3.0)]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage.toString()),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8.0),
            )),
        SizedBox(
          height: 8.0,
        ),
        Container(
          child: Text(
            article.title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        )
      ],
    ),
  );
}
