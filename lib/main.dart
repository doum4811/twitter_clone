import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/initial_screen.dart';
import 'package:twitter_clone/features/main_navigation/home_screen.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFF4693db),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
          // iconTheme: IconThemeData(
          //   size: Sizes.size32,
          //   color: Color(0xFF4693db),
          // ),
          iconTheme: IconThemeData(size: Sizes.size32, color: Colors.black),
          actionsIconTheme: IconThemeData(
            size: Sizes.size32,
            color: Colors.black,
          ),
        ),
        tabBarTheme: TabBarThemeData(
          //TabBarTheme
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: false,
        // useMaterial3: true,
        tabBarTheme: TabBarThemeData(
          //TabBarTheme
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
          indicatorColor: Colors.white,
        ),
        brightness: Brightness.dark,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        textTheme: Typography.whiteMountainView,

        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.grey.shade900,
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
          actionsIconTheme: IconThemeData(color: Colors.grey.shade100),
          iconTheme: IconThemeData(
            size: Sizes.size32,
            color: Colors.grey.shade100,
          ),
        ),
        bottomAppBarTheme: BottomAppBarThemeData(color: Colors.grey.shade900),

        primaryColor: Color(0xFFE9435A),
      ),
      // home: InitialScreen(),
      // home: ConfirmationCodeScreen(), // 임시
      home: HomeScreen(),
    );
  }
}
