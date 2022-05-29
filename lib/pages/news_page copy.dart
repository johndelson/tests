import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:holedo/controller/auth_controller.dart';
import 'package:holedo/models/holedoapi/article.dart';
import '../models/models.dart';
import '../includes/page_scaffold.dart';
import 'package:holedo/cards/holedo_cards.dart';
import 'dart:developer' as developer;

class NewsPage extends StatelessWidget {
  final String? id;
  final String? slug;
  const NewsPage({Key? key, this.id, this.slug}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    return PageScaffold(
        title: "News Content",
        body: FutureBuilder(
            future: newsController.getArticle(slug: slug),
            builder: (context, AsyncSnapshot<Article> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, index) => Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(snapshot.data!.title.toString()),
                      subtitle: Text(snapshot.data!.content.toString()),
                    ),
                  ),
                );
            }));
  }
}
