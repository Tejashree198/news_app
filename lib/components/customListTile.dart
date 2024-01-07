import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/pages/article_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlePage(article: article),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              const BoxShadow(
                color: Colors.black12,
                blurRadius: 3.0,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source.name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            )
          ],
        ),
      ));
}
