// from https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../pages/pages.dart';
import 'data.dart';

enum AppRouteConfigKind {
  unknown,
  home,
  profile,
  person,
  news,
  newscategory,
  article
}

class AppRouteConfig {
  final AppRouteConfigKind kind;
  final String? fid;
  final String? sub;
  final String? pid;
  final String? message;

  AppRouteConfig.unknown({this.message = 'error'})
      : kind = AppRouteConfigKind.unknown,
        fid = null,
        sub = null,
        pid = null;

  AppRouteConfig.home()
      : kind = AppRouteConfigKind.home,
        fid = null,
        sub = null,
        pid = null,
        message = null;

  AppRouteConfig.profile({required this.fid})
      : kind = AppRouteConfigKind.profile,
        pid = null,
        sub = null,
        message = null;

  AppRouteConfig.person({required this.fid, this.pid})
      : kind = AppRouteConfigKind.person,
        sub = null,
        message = null;

  AppRouteConfig.news({required this.fid})
      : kind = AppRouteConfigKind.news,
        sub = null,
        pid = null,
        message = null;

  AppRouteConfig.newscategory({required this.fid, required this.pid})
      : kind = AppRouteConfigKind.newscategory,
        sub = null,
        message = null;

  AppRouteConfig.article(
      {required this.fid, required this.sub, required this.pid})
      : kind = AppRouteConfigKind.article,
        message = null;
}

class AppRouterDelegate extends RouterDelegate<AppRouteConfig>
    with
        PopNavigatorRouterDelegateMixin<AppRouteConfig>,
        // ignore: prefer_mixin
        ChangeNotifier {
  final _routes = Routes.data;
  PageRouting? _selectedPage;
  PageSubRouting? _selectedSub;
  PageSubRouting? _selectedSubSub;

  // ignore: non_constant_identifier_names
  String? _404message;

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppRouteConfig get currentConfiguration => _404message != null
      ? AppRouteConfig.unknown()
      : _selectedSub != null
          ? (_selectedPage?.slug == 'profile')
              ? AppRouteConfig.person(
                  fid: _selectedPage!.slug, pid: _selectedSub!.slug)
              : _selectedSubSub != null
                  ? AppRouteConfig.article(
                      fid: _selectedPage!.slug,
                      pid: _selectedSub!.slug,
                      sub: _selectedSubSub!.slug)
                  : AppRouteConfig.newscategory(
                      fid: _selectedPage!.slug, pid: _selectedSub!.slug)
          : _selectedPage != null
              ? ((_selectedPage?.slug == 'profile')
                  ? AppRouteConfig.profile(fid: _selectedPage!.slug)
                  : AppRouteConfig.news(fid: _selectedPage!.slug))
              : AppRouteConfig.home();

  @override
  Widget build(BuildContext context) => Navigator(
        pages: [
          MaterialPage<dynamic>(
            key: const ValueKey(''),
            child: HomePage(
              routes: _routes,
              onTap: _routeTapped,
            ),
          ),
          if (_404message != null)
            MaterialPage<Four04Page>(
              key: const ValueKey('Four04Page'),
              child: Four04Page(
                message: _404message!,
              ),
            )
          else if (_selectedPage != null)
            if (_selectedPage?.slug == 'profile')
              MaterialPage<ProfilePage>(
                key: ValueKey(_selectedPage),
                child: ProfilePage(
                  route: _selectedPage!,
                  onTap: _routeSubTapped,
                ),
              ),
          if (_selectedPage != null)
            if (_selectedPage?.slug == 'news')
              MaterialPage<NewsPage>(
                key: ValueKey(_selectedPage),
                child: NewsPage(
                  route: _selectedPage!,
                  onTap: _routeSubTapped,
                ),
              ),
          if (_selectedSub != null)
            if (_selectedPage?.slug == 'profile')
              MaterialPage<PersonPage>(
                key: ValueKey(_selectedSub),
                child: PersonPage(
                  route: _selectedPage!,
                  person: _selectedSub!,
                ),
              ),
          if (_selectedSub != null)
            if (_selectedPage?.slug == 'news')
              MaterialPage<NewsCategoryPage>(
                key: ValueKey(_selectedSub),
                child: NewsCategoryPage(
                  route: _selectedPage!,
                  cat: _selectedSub!,
                  onTap: _routeSubSubTapped,
                ),
              ),
          if (_selectedSubSub != null)
            if (_selectedPage?.slug == 'news')
              MaterialPage<ArticlePage>(
                key: ValueKey(_selectedSubSub),
                child: ArticlePage(
                  route: _selectedPage!,
                  cat: _selectedSub!,
                  sub: _selectedSubSub!,
                ),
              ),
        ],
        onPopPage: (route, dynamic result) {
          if (!route.didPop(result)) return false;

          // NOTE: if you're more than one page deep, you need to decide which state to adjust
          if (route.settings is MaterialPage<ProfilePage> ||
              route.settings is MaterialPage<NewsPage>) {
            _selectedPage = null;
            _selectedSub = null;
            _selectedSubSub = null;
            notifyListeners();
          } else if (route.settings is MaterialPage<PersonPage> ||
              route.settings is MaterialPage<NewsCategoryPage>) {
            _selectedSub = null;
            _selectedSubSub = null;
            notifyListeners();
          } else if (route.settings is MaterialPage<Article>) {
            _selectedSubSub = null;
            notifyListeners();
          }

          return true;
        },
      );

  void _routeTapped(PageRouting route) {
    _selectedPage = route;
    notifyListeners();
  }

  void _routeSubTapped(PageSubRouting subroute) {
    _selectedSub = subroute;
    notifyListeners();
  }

  void _routeSubSubTapped(PageSubRouting subroute) {
    _selectedSubSub = subroute;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(AppRouteConfig configuration) async {
    switch (configuration.kind) {
      case AppRouteConfigKind.unknown:
        _selectedPage = null;
        _selectedSub = null;
        _404message = null;
        break;

      case AppRouteConfigKind.home:
        _selectedPage = null;
        _selectedSub = null;
        _404message = null;
        break;

      case AppRouteConfigKind.news:
        _selectedPage =
            _routes.singleWhereOrNull((f) => f.slug == configuration.fid);
        _selectedSub = null;
        _404message = _selectedPage == null
            ? 'news: unknown fid ${configuration.fid}'
            : null;
        break;
      case AppRouteConfigKind.newscategory:
        _selectedPage =
            _routes.singleWhereOrNull((f) => f.slug == configuration.fid);
        _selectedSub = _selectedPage?.data
            .singleWhereOrNull((p) => p.slug == configuration.pid);
        _404message = _selectedPage == null
            ? 'newscat: unknown fid ${configuration.fid}'
            : null;
        break;
      case AppRouteConfigKind.article:
        _selectedPage =
            _routes.singleWhereOrNull((f) => f.slug == configuration.fid);
        _selectedSub = _selectedPage?.data
            .singleWhereOrNull((p) => p.slug == configuration.pid);
        _selectedSubSub = _selectedSub?.data
            .singleWhereOrNull((p) => p.slug == configuration.sub);
        print(
            'fid: ${configuration.fid} selected: ${_selectedPage!.slug} sub: ${_selectedSub!.slug} pid: ${_selectedSubSub!.slug}');
        _404message = _selectedPage == null
            ? 'article: unknown fid ${configuration.fid}'
            : _selectedSub == null
                ? 'article: unknown pid ${configuration.pid}'
                : null;
        break;

      case AppRouteConfigKind.profile:
        _selectedPage =
            _routes.singleWhereOrNull((f) => f.slug == configuration.fid);
        print(
            'fid: ${configuration.fid} selected: ${_selectedPage} pid: ${configuration.pid}');
        _selectedSub = null;
        _404message = _selectedPage == null
            ? 'profile: unknown fid ${configuration.fid}'
            : null;
        break;

      case AppRouteConfigKind.person:
        _selectedPage =
            _routes.singleWhereOrNull((f) => f.slug == configuration.fid);
        _selectedSub = _selectedPage?.data
            .singleWhereOrNull((p) => p.slug == configuration.pid);
        _404message = _selectedPage == null
            ? 'person: unknown fid ${configuration.fid}'
            : _selectedSub == null
                ? 'person: unknown pid ${configuration.pid}'
                : null;
        break;
    }
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRouteConfig> {
  @override
  Future<AppRouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');

    // Handle '/ '
    if (uri.pathSegments.isEmpty) return AppRouteConfig.home();
    print('uri: ${uri.pathSegments}');

    // Handle '/profile/:id'
    if (uri.pathSegments.length > 0) {
      final fid = uri.pathSegments[0];
      if (fid.isEmpty) return AppRouteConfig.unknown();

      final pid = uri.pathSegments.length > 1 && uri.pathSegments[1].isNotEmpty
          ? uri.pathSegments[1]
          : null;
      final sub = uri.pathSegments.length > 2 && uri.pathSegments[2].isNotEmpty
          ? uri.pathSegments[2]
          : null;
      switch (fid) {
        case 'home':
          return AppRouteConfig.home();
        case 'profile':
          if (pid != null) {
            return AppRouteConfig.person(fid: fid, pid: pid);
          } else
            return AppRouteConfig.profile(fid: fid);
        case 'news':
          print('uri: ${fid} ${pid} ${sub}');
          if (pid != null) {
            if (sub != null) {
              return AppRouteConfig.article(fid: fid, sub: sub, pid: pid);
            }
            return AppRouteConfig.newscategory(fid: fid, pid: pid);
          } else
            return AppRouteConfig.news(fid: fid);
      }
    }

    // Handle unknown routes
    return AppRouteConfig.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppRouteConfig configuration) {
    switch (configuration.kind) {
      case AppRouteConfigKind.unknown:
        return const RouteInformation(location: '/404');
      case AppRouteConfigKind.home:
        return const RouteInformation(location: '/');
      case AppRouteConfigKind.news:
        return RouteInformation(location: '${configuration.fid}');
      case AppRouteConfigKind.newscategory:
        return RouteInformation(
            location: '${configuration.fid}/${configuration.pid}/');
      case AppRouteConfigKind.article:
        return RouteInformation(
            location:
                '${configuration.fid}/${configuration.pid}/${configuration.sub}/');

      case AppRouteConfigKind.profile:
        return RouteInformation(location: '${configuration.fid}');
      case AppRouteConfigKind.person:
        return RouteInformation(
            location: '${configuration.fid}/${configuration.pid}');
    }
  }
}
