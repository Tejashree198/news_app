import 'package:flutter/material.dart';
import 'package:news_app/components/customListTile.dart';
import 'package:news_app/models/article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News app", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(), // Replace 'client' with the correct variable or import the necessary package.
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                  customListTile(articles![index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
