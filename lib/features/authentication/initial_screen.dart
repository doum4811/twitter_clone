import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/authentication/widgets/auth_button.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});
  //By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: FaIcon(FontAwesomeIcons.twitter)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v96,
              Gaps.v80,
              Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.w900,
                ),
              ),

              Gaps.v96,
              Gaps.v80,

              AuthButton(
                icon: FaIcon(FontAwesomeIcons.google),
                text: "Continue with Google",
              ),
              Gaps.v16,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple",
              ),
              Gaps.v16,
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "or",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              Gaps.v4,

              AuthButton(icon: null, text: "Create account"),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('By signing up, you argree to our Terms'),
                  Text(
                    'Terms',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(','),
                ],
              ),
              Gaps.v2,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(', and'),
                  Text(
                    'Cookie Use',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(','),
                ],
              ),
              // RichText(
              //   textAlign: TextAlign.left,
              //   text: TextSpan(
              //     style: TextStyle(
              //       color: Colors.grey.shade600,
              //       fontSize: Sizes.size16,
              //     ),
              //     children: [
              //       const TextSpan(text: "By signing up, you agree to our "),
              //       TextSpan(
              //         text: "Terms",
              //         style: TextStyle(
              //           color: Colors.blue,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ),
              //       const TextSpan(text: ", "),
              //       TextSpan(
              //         text: "Privacy Policy",
              //         style: TextStyle(
              //           color: Colors.blue,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ),
              //       const TextSpan(text: ", and "),
              //       TextSpan(
              //         text: "Cookie Use.",
              //         style: TextStyle(
              //           color: Colors.blue,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.grey.shade50,
        // elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
            vertical: Sizes.size10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Have an account already?'),

              // Gaps.h5,
              GestureDetector(
                // onTap: () => _onLoginTap(context),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
