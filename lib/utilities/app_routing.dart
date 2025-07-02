import 'package:camorent/features/login.dart';
import 'package:camorent/features/splashscreen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouterConfig = GoRouter(
//  navigatorKey: navigatorKey,
  initialLocation: '/main',
  routes: [
    GoRoute(path: '/', builder: (_, __) => SplashScreen()),
    GoRoute(path: '/logIn', builder: (_, __) =>  LoginScreen()),
  ],
);
