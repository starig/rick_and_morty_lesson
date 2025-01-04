import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_lesson/features/details/view/details_view.dart';
import 'package:rick_and_morty_lesson/features/home/view/home_view.dart';

class AppRoutes {
  static const String homePath = '/';
  static const String _detailsPath = '/details/:id';

  get detailsPath => _detailsPath.replaceAll("/:id", '');
}

class AppRouterHelper {
  static final AppRouterHelper _instance = AppRouterHelper._internal();

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey = GlobalKey<NavigatorState>();

  static AppRouterHelper get instance => _instance;

  factory AppRouterHelper() {
    return _instance;
  }

  AppRouterHelper._internal() {
    final routes = [
      GoRoute(
        path: AppRoutes.homePath,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: AppRoutes._detailsPath,
        builder: (context, state) => DetailsView(
          id: int.parse(state.pathParameters['id']!),
        ),
      ),
    ];

    router = GoRouter(
      routes: routes,
      initialLocation: AppRoutes.homePath,
      navigatorKey: parentNavigatorKey,
    );
  }
}
