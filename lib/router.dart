import 'package:go_router/go_router.dart';
import 'package:twitter_clone/features/activity/activity_screen.dart';
import 'package:twitter_clone/features/main_navigation/home_screen.dart';
import 'package:twitter_clone/features/searching/search_screen.dart';
import 'package:twitter_clone/features/user/privacy_screen.dart';
import 'package:twitter_clone/features/user/settings_screen.dart';
import 'package:twitter_clone/features/user/user_profile_screen.dart';

// void Offstage(offstage = _selectedIndex != 1, child = SearchScreen()),

// void Offstage(offstage = _selectedIndex != 2, child = StfScreen()),
// void Offstage(offstage = _selectedIndex != 3, child = ActivityScreen()),
// void Offstage(offstage = _selectedIndex != 4, child = UserProfileScreen()),

final router = GoRouter(
  routes: [
    GoRoute(
      path: HomeScreen.routeURL,
      name: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: SearchScreen.routeURL,
          name: SearchScreen.routeName,
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: ActivityScreen.routeURL,
          name: ActivityScreen.routeName,
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          // path: "/profile/:username",
          path: UserProfileScreen.routeURL,
          name: UserProfileScreen.routeName,
          builder: (context, state) {
            final username = "Jane"; //state.params["username"];
            final tab = "Threads"; // state.queryParams["Replies"];
            // final tab = state.queryParams["show"];
            return UserProfileScreen(username: username); //, tab: tab);
          },
        ),
        GoRoute(
          path: SettingsScreen.routeURL,
          name: SettingsScreen.routeName,
          builder: (context, state) => const SettingsScreen(),
          routes: [
            GoRoute(
              name: PrivacyScreen.routeName,
              path: PrivacyScreen.routeURL,
              // builder: (context, state) => const PrivacyScreen(),
              builder: (context, state) {
                // final agrs = state.extra as EmailScreenArgs;
                return PrivacyScreen();
              },
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: SearchScreen.routeURL,
    //   name: SearchScreen.routeName,
    //   builder: (context, state) => const SearchScreen(),
    // ),
    // GoRoute(
    //   path: ActivityScreen.routeURL,
    //   name: ActivityScreen.routeName,
    //   builder: (context, state) => const ActivityScreen(),
    // ),
    // GoRoute(
    //   path: SettingsScreen.routeURL,
    //   name: SettingsScreen.routeName,
    //   builder: (context, state) => const SettingsScreen(),
    //   routes: [
    //     GoRoute(
    //       name: PrivacyScreen.routeName,
    //       path: PrivacyScreen.routeURL,
    //       builder: (context, state) => const PrivacyScreen(),
    //       // builder: (context, state) {
    //       //   final agrs = state.extra as EmailScreenArgs;
    //       //   return EmailScreen(username: agrs.username);
    //       // },
    //     ),
    //   ],
    // ),
  ],
);
