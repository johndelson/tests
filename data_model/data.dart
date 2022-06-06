import 'article_category.dart';
import 'block.dart';
import 'page.dart';
import 'settings.dart';

class Data {
  Settings? settings;
  Block? block;
  List<ArticleCategory>? articleCategories;
  List<Page>? pages;

  Data({this.settings, this.block, this.articleCategories, this.pages});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        settings: json['Settings'] == null
            ? null
            : Settings.fromJson(json['Settings'] as Map<String, dynamic>),
        block: json['Block'] == null
            ? null
            : Block.fromJson(json['Block'] as Map<String, dynamic>),
        articleCategories: (json['ArticleCategories'] as List<dynamic>?)
            ?.map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        pages: (json['pages'] as List<dynamic>?)
            ?.map((e) => Page.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Settings': settings?.toJson(),
        'Block': block?.toJson(),
        'ArticleCategories': articleCategories?.map((e) => e.toJson()).toList(),
        'pages': pages?.map((e) => e.toJson()).toList(),
      };
}
