import 'package:pokedex/features/home/home.dart';

import 'routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.initial.path,
        name: AppRoutes.initial.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
