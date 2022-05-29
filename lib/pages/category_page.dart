import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import '../models/holedoapi/article.dart';
import '../cards/holedo_cards.dart';
import '../models/models.dart';
import '../includes/page_scaffold.dart';
import 'dart:developer' as developer;

class CategoryPage extends StatelessWidget {
  final ArticleCategory category;

  const CategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(HoledoDatabase().news);

    return PageScaffold(
      title: "Category News",
      body: FutureBuilder(
          future: newsController.fetchArticles(category: category.slug),
          builder: (context, AsyncSnapshot<List<Article>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return AlignedGridView.count(
                crossAxisCount: 2,
                itemCount: snapshot.data!.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return NewsCard(
                      article: snapshot.data![index], showReleaseDate: true);
                },

                //TileBuilder: (index) => StaggeredTile.fit(1),
              );
          }),
    );
  }
}

/** ListView(
        children: [Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              category.title as String,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
 * Center(
            child: Container(
              color: Color(0xff202f3f),
              height: 500,
              child: Obx(
                () {
                  if (newsController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    developer.log(
                      'log me',
                      name: 'my.app.category',
                      error: json.encode(newsController.dataList),
                    );
                    return AlignedGridView.count(
                      crossAxisCount: 2,
                      itemCount: newsController.dataList.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return NewsCard(
                            article: newsController.dataList[index] as Article,
                            showReleaseDate: true);
                      },

                      //TileBuilder: (index) => StaggeredTile.fit(1),
                    );
                  }
                },
              ),
            ),
          ),
 */
