import 'dart:convert';

import 'package:holedo/models/holedoapi/page.dart';
import 'package:holedo/models/holedoapi/user.dart';

import 'article.dart';
import 'article_category.dart';
import 'block.dart';
import 'job.dart';
import 'settings.dart';
import 'user.dart';

List<DataModel> dataFromJson(Iterable<dynamic> data) => List<DataModel>.from(
    data.map((x) => DataModel.fromJson(x as Map<String, dynamic>)));

String dataToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  Settings? settings;
  Block? block;
  List<ArticleCategory>? articleCategories;
  int? count;
  List<Article>? articles;
  Article? article;
  List<Job>? jobs;
  Job? job;
  List<User>? users;
  User? user;
  String? token;
  List<Page>? pages;

  DataModel(
      {this.settings,
      this.block,
      this.articleCategories,
      this.count,
      this.articles,
      this.article,
      this.jobs,
      this.job,
      this.users,
      this.user,
      this.token,
      this.pages});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        settings: json['Settings'] == null
            ? null
            : Settings.fromJson(json['Settings'] as Map<String, dynamic>),
        block: json['Block'] == null
            ? null
            : Block.fromJson(json['Block'] as Map<String, dynamic>),
        articleCategories: (json['ArticleCategories'] as List<dynamic>?)
            ?.map((e) => ArticleCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        count: json['count'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
        article: json['article'] == null
            ? null
            : Article.fromJson(json['article'] as Map<String, dynamic>),
        jobs: (json['jobs'] as List<dynamic>?)
            ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
            .toList(),
        job: json['job'] == null
            ? null
            : Job.fromJson(json['job'] as Map<String, dynamic>),
        users: (json['users'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] == null ? null : json['token'] as String?,
        pages: json['pages'] == null
            ? null
            : (json['pages'] as List<dynamic>?)
                ?.map((e) => Page.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Settings': settings?.toJson(),
        'Block': block?.toJson(),
        'ArticleCategories': articleCategories?.map((e) => e.toJson()).toList(),
        'count': count,
        'articles': articles?.map((e) => e.toJson()).toList(),
        'article': article?.toJson(),
        'jobs': jobs?.map((e) => e.toJson()).toList(),
        'job': job?.toJson(),
        'users': users?.map((e) => e.toJson()).toList(),
        'user': user?.toJson(),
        'token': token,
        'pages': pages?.map((e) => e.toJson()).toList(),
      };
}
