class Person {
  final String id;
  final String name;
  final String slug;
  final int age;
  Person(
      {required this.id,
      required this.slug,
      required this.name,
      required this.age});
}

class Profile {
  final String id;
  final String name;
  final String slug;
  final List<Person> people;
  Profile(
      {required this.id,
      required this.slug,
      required this.name,
      required this.people});
}

class Profiles {
  static final data = [
    Profile(
      id: 'f1',
      name: 'Sells',
      slug: 'sells',
      people: [
        Person(id: 'p1', slug: 'Chris', name: 'Chris', age: 50),
        Person(id: 'p2', slug: 'John', name: 'John', age: 25),
        Person(id: 'p3', slug: 'Tom', name: 'Tom', age: 24),
      ],
    ),
    Profile(
      id: 'f2',
      name: 'Addams',
      slug: 'sddams',
      people: [
        Person(id: 'p1', slug: 'Gomez', name: 'Gomez', age: 55),
        Person(id: 'p2', slug: 'Morticia', name: 'Morticia', age: 50),
        Person(id: 'p3', slug: 'Pugsley', name: 'Pugsley', age: 10),
        Person(id: 'p4', slug: 'Wednesday', name: 'Wednesday', age: 17),
      ],
    ),
  ];
}

class Article {
  final String id;
  final String title;
  final String slug;
  final String date;
  final String content;
  Article({
    required this.id,
    required this.slug,
    required this.title,
    required this.date,
    required this.content,
  });
}

class NewsCategory {
  final String id;
  final String title;
  final String slug;
  final List<Article> articles;
  NewsCategory(
      {required this.id,
      required this.slug,
      required this.title,
      required this.articles});
}

class News {
  static final data = [
    NewsCategory(
      id: 'n1',
      title: 'Pinned News',
      slug: 'pin',
      articles: [],
    ),
    NewsCategory(
      id: 'n2',
      title: 'Latest News',
      slug: 'latest_news',
      articles: [],
    ),
  ];
}

class PageRouting {
  final String id;
  final String title;
  final String slug;
  final List<PageSubRouting> data;
  PageRouting(
      {required this.id,
      required this.slug,
      required this.title,
      required this.data});
}

class PageSubRouting {
  final String id;
  final String title;
  final String slug;
  final List<PageSubRouting> data;
  PageSubRouting(
      {required this.id,
      required this.slug,
      required this.title,
      required this.data});
}

class Routes {
  static final data = [
    PageRouting(
      id: 'f1',
      title: 'Home',
      slug: 'home',
      data: [],
    ),
    PageRouting(
      id: 'f2',
      title: 'Profile',
      slug: 'profile',
      data: [
        PageSubRouting(id: 'p1', slug: 'gomez', title: 'Gomez', data: []),
        PageSubRouting(id: 'p2', slug: 'morticia', title: 'Morticia', data: []),
        PageSubRouting(id: 'p3', slug: 'pugsley', title: 'Pugsley', data: []),
        PageSubRouting(
            id: 'p4', slug: 'wednesday', title: 'Wednesday', data: []),
      ],
    ),
    PageRouting(
      id: 'f3',
      title: 'News',
      slug: 'news',
      data: [
        PageSubRouting(id: 'p1', slug: 'alert', title: 'Alert', data: [
          PageSubRouting(
              id: 'p1',
              slug: 'aticle4alert',
              title: 'aticle tITLEAlert',
              data: []),
          PageSubRouting(
              id: 'p2',
              slug: 'aticle4success',
              title: 'aticle tITLESuccess',
              data: []),
          PageSubRouting(
              id: 'p3',
              slug: 'aticle4warning',
              title: 'aticle tITLEWarning',
              data: []),
          PageSubRouting(
              id: 'p4',
              slug: 'aticle4danger',
              title: 'aticle tITLEDanger',
              data: []),
        ]),
        PageSubRouting(id: 'p2', slug: 'success', title: 'Success', data: [
          PageSubRouting(
              id: 'p1',
              slug: 'aticle2alert',
              title: 'aticle tITLEAlert',
              data: []),
          PageSubRouting(
              id: 'p2',
              slug: 'aticle2success',
              title: 'aticle tITLESuccess',
              data: []),
          PageSubRouting(
              id: 'p3',
              slug: 'aticle2warning',
              title: 'aticle tITLEWarning',
              data: []),
          PageSubRouting(
              id: 'p4',
              slug: 'aticle2danger',
              title: 'aticle tITLEDanger',
              data: []),
        ]),
        PageSubRouting(id: 'p3', slug: 'warning', title: 'Warning', data: [
          PageSubRouting(
              id: 'p1',
              slug: 'aticle1alert',
              title: 'aticle3 tITLE Alert',
              data: []),
          PageSubRouting(
              id: 'p2',
              slug: 'aticle1success',
              title: 'aticle3 tITLESuccess',
              data: []),
          PageSubRouting(
              id: 'p3',
              slug: 'aticle1warning',
              title: 'aticle 3tITLEWarning',
              data: []),
          PageSubRouting(
              id: 'p4',
              slug: 'aticle1danger',
              title: 'aticle3 tITLEDanger',
              data: []),
        ]),
        PageSubRouting(id: 'p4', slug: 'danger', title: 'Danger', data: []),
      ],
    )
  ];
}
