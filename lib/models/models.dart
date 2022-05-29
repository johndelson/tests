export 'package:get/get.dart';
export 'holedoapi/holedoapi.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';

import 'package:holedo/models/holedoapi/user.dart';
import 'package:holedo/models/holedoapi/job.dart';
import '../services/holedo_api_services.dart';
import 'holedoapi/data.dart';

class AppState extends ChangeNotifier {
  AppState({String? username, User? profile})
      : _username = username,
        _profile = profile;

  bool get isLoggedIn => _username != null;

  String? _username;
  User? _profile;
  String? get username => _username;

  set data(String data) {}
  set username(String? value) {
    _username = value;
    notifyListeners();
  }

  User? get profile => _profile;
  set profile(User? data) {
    _profile = data;
    _username = data?.fullName;
    notifyListeners();
  }

  final List<User> _profiles = [];
  Iterable<User> get profiles => List.unmodifiable(_profiles);

  void addProfile(User data) {
    _profiles.add(data);
    notifyListeners();
  }
}

class Book {
  final String id;
  final String title;
  final String description;
  final DateTime releaseDate;
  final List<BookCategory> categories;
  final bool isStaffPick;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.releaseDate,
    required this.categories,
    required this.isStaffPick,
  });
}

enum BookCategory {
  fiction,
  nonFiction,
}

extension BookCategoryExtension on BookCategory {
  String get displayName {
    switch (this) {
      case BookCategory.fiction:
        return 'Fiction';
      case BookCategory.nonFiction:
        return 'Non-fiction';
    }
  }

  String get queryParam {
    switch (this) {
      case BookCategory.fiction:
        return 'fiction';
      case BookCategory.nonFiction:
        return 'nonfiction';
    }
  }
}

class HoledoDatabase extends GetxController {
  var isLoading = true.obs;
  final apiHost = 'api.holedo.com';
  final apiKey = 'holedo_flutter_tests';
  final token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjM2MDgsImV4cCI6MTk2NzU1MDk5MH0.TTXGrAWbFkpMgjzzh2kly0RqyLxc_NzPIlyr7nzvc_I';
  final box = GetStorage();
  DataModel? settingsList;
  List<ArticleCategory> articleCategories = [];
  List<Article> articles = [];
  final List<String> articlePaths = [];
  final ApiServices _api = ApiServices();
  void getArticleCategories() async {
    articleCategories = getModel().articleCategories as List<ArticleCategory>;
  }

  final NewsController news = NewsController();
  final UsersController users = UsersController();
  final JobsController jobs = JobsController();
  Future<void> init() async {
    await GetStorage.init();
    print('starting website... ');
    final model = getModel();
    // ignore: unnecessary_null_comparison
    if (model.settings != null) {
      print('cache: ${box.read('model').toString()}');
    } else {
      final model = await this.fetchSettings();
      print('after: ${model}');
    }

    // final model = getModel();
    if (model!.user?.fullName != null) {
      print('cached user: ${model.user?.fullName}');
    }
  }

  void setModel(DataModel model) {
    box.write('model', model.toJson());
  }

  void resetModel() {
    box.erase();
    box.remove('model');
  }

  DataModel getModel() {
    //print('model: ${box.read('model')}');
    final map = box.read('model') ?? {'test': 'data'};

    return DataModel.fromJson(map as Map<String, dynamic>);
  }

  Future<dynamic> fetchSettings() async {
    try {
      isLoading(true);
      DataModel data;

      var response = await _api.getSettings();
      data = response.data as DataModel;
      print('set cache: ${data}');
      this.setModel(data);

      if (data != null) {
        settingsList = data;
        print('set: ${settingsList}');

        articleCategories = data.articleCategories as List<ArticleCategory>;
        for (final category in articleCategories
            .where((category) => category.menuItem == true)) {
          articlePaths.add(category.slug as String);
        }
        print('articlePaths: ${articlePaths}');
        return data;
      }
    } finally {
      isLoading(false);
    }
  }

  final Iterable<Book> books = List.unmodifiable([
    Book(
      id: '1',
      title: 'Hummingbirds for Dummies',
      description: "Find out all about Hummingbirds, and how awesome they are.",
      releaseDate: DateTime(1985, 3, 23),
      categories: [BookCategory.nonFiction],
      isStaffPick: true,
    ),
    Book(
      id: '2',
      title: "Of Hummingbirds And Men",
      description: "blah blah blha",
      releaseDate: DateTime(1923, 1, 1),
      categories: [BookCategory.fiction],
      isStaffPick: false,
    ),
    Book(
      id: '3',
      title: "Gone With The Hummingbirds",
      description:
          "Set in the American South, this book tells the story of Dash O'Bird, the strong-willed daughter...",
      releaseDate: DateTime(1936, 6, 30),
      categories: [BookCategory.fiction],
      isStaffPick: false,
    ),
    Book(
      id: '4',
      title: "Harry Potter and the Chamber of Hummingbirds",
      description: "Wizard and Hummingbirds! What more could you want?",
      releaseDate: DateTime(1998, 7, 2),
      categories: [BookCategory.fiction],
      isStaffPick: true,
    ),
  ]);
}

class UsersController extends GetxController {
  var isLoading = true.obs;
  var isLogin = false.obs;
  var token = ''.obs;
  var userList = [].obs;
  dynamic user = ''.obs;
  var page = 1;
  var limit = 10;
  final ApiServices _api = ApiServices();

  @override
  void onInit() {
    //checkLogin();
    super.onInit();
  }

  Future<User> login({required String email, required String password}) async {
    try {
      isLoading(true);
      var response = await _api.login(email: email, password: password);
      print('log: ${response.data?.token}');
      if (response == null) {
        return response as User;
      }
      if (response.success == true) {
        isLogin.value = true;
        token.value = response.data?.token as String;

        user = response.data?.user as User;
        final model = Get.put(HoledoDatabase()).getModel();
        model.token = response.data?.token;
        model.user = user as User;
        print('db save: ${model.user}');
        Get.find<HoledoDatabase>().setModel(model);
      }
      return user as User;
    } finally {
      isLoading(false);
    }
  }

  Future<User> getProfileData({String? slug, String? id, String? token}) async {
    try {
      isLoading(true);
      final model = Get.put(HoledoDatabase()).getModel();
      if (model.user?.slug == slug) {
        print('natch: ${slug} token: ${model.token}');
        token = model.token;
      }
      User? user = await _api.getUserData(id: id, slug: slug, token: token);
      print('log: ${user.firstName}');

      if (model.user?.slug == slug) {
        model.user = user;
        print('update user: ${model.user}');
        Get.find<HoledoDatabase>().setModel(model);
      }
      return user;
    } finally {
      isLoading(false);
    }
  }

  Future<List<User>?> fetchUsers(
      {String? category, String? type, int? limit, int? page}) async {
    try {
      isLoading(true);

      var response = await _api.getUsersList(
          category: category,
          type: type,
          limit: limit == null ? this.limit : limit,
          page: page == null ? this.page : page);

      if (response != null) {
        userList.value = response;
      }

      return response;
    } finally {
      isLoading(false);
    }
  }

  void fetch({String? slug, String? id}) async {
    try {
      isLoading(true);
      var response = await _api.getUserData(id: id, slug: slug);
      print('log: ${response}');
      if (response != null) {
        user = response;
      }
    } finally {
      isLoading(false);
    }
  }
}

class NewsController extends GetxController {
  var isLoading = true.obs;
  var dataList = [].obs;
  var article = Article().obs;
  List<Article> articleList = [];
  var page = 1;
  var limit = 10;
  final ApiServices _api = ApiServices();
  @override
  void onInit() {
    //fetch();
    super.onInit();
  }

  Future<Article> getArticle({String? slug, String? id}) async {
    try {
      isLoading(true);
      //var check = articleList.firstWhere((e) => e.slug == slug);
      //if (check != null) {
      //  print('cache: ${check.title}');
      //   return check;
      // }
      var response = await _api.getArticle(id: id, slug: slug);
      print('res: ${response.data?.article}');
      if (response != null) {
        article.value = response.data?.article as Article;
      }
      // if (articleList.any((e) => e.id != article.value.id))
      // articleList.add(article.value);
      return article.value;
    } finally {
      isLoading(false);
    }
  }

  Future<List<Article>> fetchArticles(
      {String? category, String? type, int? limit, int? page}) async {
    try {
      isLoading(true);

      var response = await _api.getArticleList(
          category: category,
          type: type,
          limit: limit == null ? this.limit : limit,
          page: page == null ? this.page : page);

      if (response != null) {
        dataList.value = response;
      }
      for (final data in response) {
        // print('data: ${data.title}');
        // print('uu: ${data.user}');
      }
      //for (final data in response
      //  .where((data) => articleList.any((e) => e.id == data.id))) {
      //articleList.add(dataList.value);
      //}
      return response;
    } finally {
      isLoading(false);
    }
  }
}

class JobsController extends GetxController {
  var isLoading = true.obs;
  var dataList = [].obs;
  var job = Job().obs;
  List<Job> jobList = [];
  var page = 1;
  var limit = 10;
  final ApiServices _api = ApiServices();
  @override
  void onInit() {
    //fetch();
    super.onInit();
  }

  Future<Job> getJob({String? slug, String? id}) async {
    try {
      isLoading(true);
      var response = await _api.getJob(id: id, slug: slug);
      if (response != null) {
        job.value = response.data?.job as Job;
      }
      return job.value;
    } finally {
      isLoading(false);
    }
  }

  Future<List<Job>> fetchJobs(
      {String? category, String? type, int? limit, int? page}) async {
    try {
      isLoading(true);
      print('wtf ::... ${type}');
      var response = await _api.getJobsList(
          category: category,
          type: type,
          limit: limit == null ? this.limit : limit,
          page: page == null ? this.page : page);

      if (response != null) {
        dataList.value = response;
      }

      return response;
    } finally {
      isLoading(false);
    }
  }
}

class Profile {
  final String title;
  final String id;
  final String? username;
  final List<String> bookIds;

  String get shareUrl => '/profile/$id';

  Profile({
    required this.id,
    required this.title,
    required this.username,
    required this.bookIds,
  });
}
