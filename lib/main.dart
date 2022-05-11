import 'package:flutter/material.dart';
import 'includes/url_strategy.dart';
import 'routing/routing.dart';

void main() {
  usePathUrlStrategy();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: AppRouteInformationParser(),
        routerDelegate: AppRouterDelegate(),
        title: 'Flutter Deep Linking Demo',
      );
}
