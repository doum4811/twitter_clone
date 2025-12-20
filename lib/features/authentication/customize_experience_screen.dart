import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/utils.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _trackingEnabled = false;

  void _onNextTap() {
    if (_trackingEnabled) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final enabledBg = isDarkMode(context) ? Colors.white : Colors.black;
    final enabledFg = isDarkMode(context) ? Colors.black : Colors.white;

    final disabledBg = isDarkMode(context)
        ? Colors.white24
        : Colors.grey.shade400;
    final disabledFg = isDarkMode(context) ? Colors.white38 : Colors.black38;

    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(FontAwesomeIcons.twitter),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v32,

            const Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v24,
            const Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gaps.v20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Twitter uses this data to personalize your experience. "
                    "This web browsing history will never be stored with your "
                    "name, email, or phone number.",
                    style: TextStyle(
                      fontSize: Sizes.size14 + Sizes.size1,
                      height: 1.4,
                      color: isDarkMode(context)
                          ? Colors.white70
                          : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // const SizedBox(width: 16),

                // 스위치
                Transform.scale(
                  scale: 1.2,
                  child: CupertinoSwitch(
                    value: _trackingEnabled,
                    onChanged: (value) {
                      setState(() => _trackingEnabled = value);
                    },
                  ),
                ),
              ],
            ),
            Gaps.v24,
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "By signing up, you agree to our Term, Privacy"
                        "Policy, and Cookie Use. Twitter may use your ",
                        style: TextStyle(
                          fontSize: Sizes.size14 + Sizes.size1,
                          height: 1.4,
                          color: isDarkMode(context)
                              ? Colors.white60
                              : Colors.grey.shade800,
                        ),
                      ),
                    ),
                    // Text('By signing up, you agree to our'),
                    // Text(
                    //   'Term, Privacy',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     color: Theme.of(context).primaryColor,
                    //   ),
                    // ),
                    // Text(', and '),
                    // Text(
                    //   'Cookie Use',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w400,
                    //     color: Theme.of(context).primaryColor,
                    //   ),
                    // ),
                    // Text('.'),
                    // const SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _trackingEnabled ? _onNextTap : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: _trackingEnabled
              //     ? Colors
              //           .black //Theme.of(context).primaryColor
              //     : Colors.grey.shade400,
              color: _trackingEnabled ? enabledBg : disabledBg,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                // color: _trackingEnabled ? Colors.white : Colors.black38,
                color: _trackingEnabled ? enabledFg : disabledFg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
