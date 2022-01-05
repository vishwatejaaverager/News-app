import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/custom_list_tile.dart';
import 'package:flutter_application_3/news.dart';

import 'models/articles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  News news = News();
  // ignore: unnecessary_new
  Future<List<Article>>? futureWords;

  @override
  void initState() {
    _pullRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Article>>(
          future: futureWords,
          builder: (context, AsyncSnapshot<List<Article>> snap) {
            if (snap.hasData) {
              List<Article> articles = snap.data!;

              return RefreshIndicator(
                onRefresh: () {
                  setState(() {});
                  return _pullRefresh();
                },
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return customListTile(articles[index]);
                    }),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pullRefresh();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<List<Article>> _pullRefresh() async {
    List<Article> freshWords = await news.getApi();
    setState(() {
      futureWords = Future.value(freshWords);
    });

    return futureWords!;
  }
}
