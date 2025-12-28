import 'package:go_router/go_router.dart';
import 'package:twitter_clone/features/activity/activity_screen.dart';
import 'package:twitter_clone/features/main_navigation/home_screen.dart';
import 'package:twitter_clone/features/main_navigation/main_navigation_screen.dart';
import 'package:twitter_clone/features/searching/search_screen.dart';
import 'package:twitter_clone/features/user/settings_screen.dart';
import 'package:twitter_clone/features/user/privacy_screen.dart';
import 'package:twitter_clone/features/user/user_profile_screen.dart';
// 필요하면 다른 페이지 추가

final router = GoRouter(
  routes: [
    // GoRoute(
    // //   path: "/",
    // //   name: MainNavigationScreen.routeName,
    // //   builder: (context, state) => const MainNavigationScreen(tab: ""),
    // // ),
    // // GoRoute(
    // //   path: SearchScreen.routeURL,
    // //   name: SearchScreen.routeName,
    // //   //builder: (context, state) => const SearchScreen(),
    // //   builder: (context, state) =>
    // //       const MainNavigationScreen(tab: "search"),
    // // ),
    GoRoute(
      path: HomeScreen.routeURL,
      name: HomeScreen.routeName,
      builder: (context, state) => const MainNavigationScreen(tab: "/"),
    ),
    GoRoute(
      path: SearchScreen.routeURL,
      name: SearchScreen.routeName,
      builder: (context, state) => const MainNavigationScreen(tab: "search"),
    ),
    GoRoute(
      path: ActivityScreen.routeURL,
      name: ActivityScreen.routeName,
      builder: (context, state) =>
          const MainNavigationScreen(tab: "activity"), //const ActivityScreen(),
    ),
    GoRoute(
      // path: "/profile/:username",
      path: UserProfileScreen.routeURL,
      name: UserProfileScreen.routeName,
      // builder: (context, state) {
      //   final username = "Jane"; //state.params["username"];
      //   final tab = "Threads"; // state.queryParams["Replies"];
      //   // final tab = state.queryParams["show"];
      //   return UserProfileScreen(username: username); //, tab: tab);
      // },
      builder: (context, state) => const MainNavigationScreen(tab: "profile"),
    ),
    GoRoute(
      path: SettingsScreen.routeURL,
      name: SettingsScreen.routeName,
      builder: (context, state) => const SettingsScreen(),
      routes: [
        GoRoute(
          path: PrivacyScreen.routeURL,
          name: PrivacyScreen.routeName,
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
  ],
);
