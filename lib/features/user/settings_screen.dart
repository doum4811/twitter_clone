import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/user/privacy_screen.dart';
import 'package:twitter_clone/features/user/view_models/theme_notifier.dart';
// import 'package:twitter_clone/features/user/view_models/theme_view_model.dart';
import 'package:twitter_clone/utils.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  static String routeURL = "/settings";
  static String routeName = "settings";
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  void _goPrivacy() {
    context.pushNamed(PrivacyScreen.routeName);
  }

  void _showLogoutDialog() {
    // if (Platform.isIOS) {
    //   showCupertinoDialog(
    //     context: context,
    //     builder: (context) => CupertinoAlertDialog(
    //       title: const Text("Log out"),
    //       content: const Text("Are you sure you want to log out?"),
    //       actions: [
    //         CupertinoDialogAction(
    //           onPressed: () => Navigator.of(context).pop(),
    //           child: const Text("Cancel"),
    //         ),
    //         CupertinoDialogAction(
    //           isDestructiveAction: true,
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //             // TODO: 로그아웃 처리
    //           },
    //           child: const Text("Log out"),
    //         ),
    //       ],
    //     ),
    //   );
    //   return;
    // }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Log out"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: 로그아웃 처리
            },
            child: const Text("Log out", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    final themeState = ref.watch(themeProvider);
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.5,
        leadingWidth: 100,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: isDark ? Colors.white : Colors.black,
          ),
          label: Text(
            "Back",
            style: TextStyle(
              fontSize: Sizes.size18,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            //color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            // leading: const Icon(Icons.person_add_alt_1_outlined),
            leading: const FaIcon(
              FontAwesomeIcons.userPlus,
              // color: Colors.black,
            ),
            title: const Text(
              "Follow and invite friends",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {},
          ),
          ListTile(
            // leading: const Icon(Icons.notifications_none),
            leading: const FaIcon(
              FontAwesomeIcons.bell,
            ), // color: Colors.black),
            title: const Text("Notifications", style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            // leading: const Icon(Icons.lock_outline, color: Colors.black),
            leading: const FaIcon(
              FontAwesomeIcons.lock,
            ), //color: Colors.black),
            title: const Text("Privacy", style: TextStyle(fontSize: 20)),
            onTap: _goPrivacy,
          ),
          ListTile(
            // leading: const Icon(Icons.account_circle_outlined),
            leading: const FaIcon(
              FontAwesomeIcons.circleUser,
              //color: Colors.black,
            ),
            title: const Text("Account", style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            // leading: const Icon(Icons.help_outline),
            leading: const FaIcon(
              FontAwesomeIcons.lifeRing,
              // color: Colors.black,
            ),
            title: const Text("Help", style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline), // color: Colors.black),
            // leading: const FaIcon(FontAwesomeIcons.circleInfo),
            title: const Text("About", style: TextStyle(fontSize: 20)),
            onTap: () {},
          ),
          const SizedBox(height: 24),
          ListTile(
            title: const Text(
              "Log out",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            onTap: _showLogoutDialog,
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeState.isDark,
            onChanged: (value) {
              ref.read(themeProvider.notifier).setDarkMode(value);
            },
          ),
        ],
      ),
    );
  }
}
