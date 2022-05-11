import 'package:flutter/material.dart';
import '../routing/data.dart';

class HomePage extends StatelessWidget {
  final List<PageRouting> routes;
  final ValueChanged<PageRouting> onTap;
  const HomePage({required this.routes, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('TEST')),
        body: ListView(
          children: [
            for (final f in routes)
              ListTile(title: Text(f.title), onTap: () => onTap(f))
          ],
        ),
      );
}

class ProfilePage extends StatelessWidget {
  final PageRouting route;
  final ValueChanged<PageSubRouting> onTap;
  const ProfilePage({required this.route, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(route.title)),
        body: ListView(
          children: [
            for (final p in route.data)
              ListTile(title: Text(p.title), onTap: () => onTap(p))
          ],
        ),
      );
}

class PersonPage extends StatelessWidget {
  final PageRouting route;
  final PageSubRouting person;
  const PersonPage({required this.route, required this.person, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(person.title)),
      body: Text('${person.title} ${route.title} is here'));
}

class Four04Page extends StatelessWidget {
  final String message;
  const Four04Page({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: Center(child: Text(message)),
      );
}

class NewsPage extends StatelessWidget {
  final PageRouting route;
  final ValueChanged<PageSubRouting> onTap;
  const NewsPage({required this.route, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(route.title)),
        body: ListView(
          children: [
            for (final p in route.data)
              ListTile(
                  title: Text('Category: ${p.title}'), onTap: () => onTap(p))
          ],
        ),
      );
}

class NewsCategoryPage extends StatelessWidget {
  final PageRouting route;
  final PageSubRouting cat;
  final ValueChanged<PageSubRouting> onTap;
  const NewsCategoryPage(
      {required this.route, required this.cat, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Category: ${cat.title}')),
        body: ListView(
          children: [
            for (final p in cat.data)
              ListTile(title: Text('News: ${p.title}'), onTap: () => onTap(p))
          ],
        ),
      );
}

class ArticlePage extends StatelessWidget {
  final PageRouting route;
  final PageSubRouting cat;
  final PageSubRouting sub;
  const ArticlePage(
      {required this.route, required this.cat, required this.sub, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text(sub.title)),
      body: Text('${sub.title} ${route.title} is here'));
}
