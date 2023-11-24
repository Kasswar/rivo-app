import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rivo_app/core/constant/routes.dart';
import 'package:rivo_app/features/auth/presentation/login/page/login_screen.dart';
import 'package:rivo_app/features/auth/presentation/register/page/register_screen.dart';
import 'package:rivo_app/features/home/presentation/page/home_screen.dart';
import 'package:rivo_app/features/splash_screen/page/splash_screen.dart';

GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/splashScreen',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const Directionality(
              textDirection: TextDirection.rtl, child: LoginScreen()),
    ),
    GoRoute(
      name: AppRouter.home,
      path: AppRouter.home,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      name: AppRouter.login,
      path: AppRouter.login,
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
    GoRoute(
      name: AppRouter.register,
      path: AppRouter.register,
      builder: (BuildContext context, GoRouterState state) =>
          const Directionality(
              textDirection: TextDirection.rtl, child: RegisterScreen()),
    ),
    GoRoute(
      name: AppRouter.splashScreen,
      path: AppRouter.splashScreen,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
  ],
);
