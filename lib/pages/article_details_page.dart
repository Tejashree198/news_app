import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class ArticlePage extends StatelessWidget {
  final Article article;
  const ArticlePage({required this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article title'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
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
            SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source.name,
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            )
          ])),
    );
  }
}
