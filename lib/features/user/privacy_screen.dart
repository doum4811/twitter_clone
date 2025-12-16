import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/sizes.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _privateProfile = true;

  void _privateProfileChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _privateProfile = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leadingWidth: 100,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: Colors.black,
          ),
          label: const Text(
            "Back",
            style: TextStyle(fontSize: Sizes.size18, color: Colors.black),
          ),
        ),
        title: const Text(
          "Privacy",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: _privateProfile,
            onChanged:
                _privateProfileChanged, //(value) => setState(() => _privateProfile = value),
            // secondary: const Icon(Icons.lock_outline),
            secondary: const FaIcon(FontAwesomeIcons.lock, color: Colors.black),

            title: const Text(
              "Private profile",
              style: TextStyle(fontSize: 20),
            ),
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.black,
          ),
          ListTile(
            // leading: const Icon(Icons.alternate_email),
            leading: const FaIcon(FontAwesomeIcons.at, color: Colors.black),

            title: const Text("Mentions", style: TextStyle(fontSize: 20)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Everyone",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                ),
                const SizedBox(width: 8),
                Icon(Icons.chevron_right, color: Colors.grey.shade500),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            // leading: const Icon(Icons.notifications_off_outlined),
            leading: const FaIcon(
              FontAwesomeIcons.bellSlash,
              color: Colors.black,
            ),

            title: const Text("Muted", style: TextStyle(fontSize: 20)),
            trailing: Icon(Icons.chevron_right, color: Colors.grey.shade500),
            onTap: () {},
          ),
          ListTile(
            // leading: const Icon(Icons.visibility_off_outlined),
            leading: const FaIcon(
              FontAwesomeIcons.eyeSlash,
              color: Colors.black,
            ),
            title: const Text("Hidden Words", style: TextStyle(fontSize: 20)),
            trailing: Icon(Icons.chevron_right, color: Colors.grey.shade500),

            onTap: () {},
          ),
          ListTile(
            // leading: const Icon(Icons.group_outlined),
            leading: const FaIcon(
              FontAwesomeIcons.userGroup,
              color: Colors.black,
            ),
            title: const Text(
              "Profiles you follow",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Icon(Icons.chevron_right, color: Colors.grey.shade500),
            onTap: () {},
          ),
          const SizedBox(height: 18),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Other privacy settings",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            // leading: const Icon(Icons.block),
            leading: const FaIcon(
              FontAwesomeIcons.circleXmark,
              color: Colors.black,
            ),
            title: const Text(
              "Blocked profiles",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Icon(Icons.open_in_new, color: Colors.grey.shade500),
            onTap: () {},
          ),
          ListTile(
            // leading: const Icon(
            //   Icons.favorite_border_sharp,
            //   color: Colors.black,
            // ),
            leading: const FaIcon(
              FontAwesomeIcons.heartCrack,
              color: Colors.black,
            ),
            title: const Text("Hide likes", style: TextStyle(fontSize: 20)),
            trailing: Icon(Icons.open_in_new, color: Colors.grey.shade500),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
