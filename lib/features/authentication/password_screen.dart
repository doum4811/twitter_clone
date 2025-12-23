import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/onboarding/interests_screen.dart';
import 'package:twitter_clone/utils.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length >= 8;
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => BirthdayScreen()),
    // );
  }

  // void _onClearTap() {
  //   _passwordController.clear();
  // }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  void _onNextTap() {
    // MaterialPageRoute(builder: (context) => ConfirmationCodeScreen());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InterestsScreen(),

        // ConfirmationCodeScreen(email: _formData["email"]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    final enabledBg = isDark ? Colors.white : Colors.black;
    final enabledFg = isDark ? Colors.black : Colors.white;

    final disabledBg = isDark ? Colors.white24 : Colors.grey.shade400;
    final disabledFg = isDark ? Colors.white38 : Colors.black38;

    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: isDark ? Colors.white : const Color(0xFF4693db),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "You'll need a password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Gaps.v24,
              Text("Make sure it's 8 characters or more.\n"),
              // Text('Enter it below to verify\n${widget.email}'),
              const SizedBox(height: 16),
              // OtpCodeInput(controllers: _controllers),
              TextField(
                controller: _passwordController,
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                autocorrect: false,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // GestureDetector(
                      //   onTap: _onClearTap,
                      //   child: FaIcon(
                      //     FontAwesomeIcons.solidCircleXmark,
                      //     color: Colors.grey.shade500,
                      //     size: Sizes.size20,
                      //   ),
                      // ),
                      // Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          // FontAwesomeIcons.eyeSlash,
                          _obscureText
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Colors.grey.shade500,
                          size: Sizes.size20,
                        ),
                      ),
                      if (_isPasswordValid()) ...[
                        Gaps.h16,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.green.shade500,
                          size: Sizes.size20,
                        ),
                      ],
                    ],
                  ),
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),

              Gaps.v24,
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          // behavior: HitTestBehavior.translucent,
          // onTap: _trackingEnabled ? _onNextTap : null,
          onTap: _isPasswordValid() ? _onNextTap : null,
          // onTap: _onNaxtTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: _isPasswordValid()
              //     ? Colors
              //           .black //Theme.of(context).primaryColor
              //     : Colors.grey.shade400,
              color: _isPasswordValid() ? enabledBg : disabledBg,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                // color: _isPasswordValid() ? Colors.white : Colors.black38,
                color: _isPasswordValid() ? enabledFg : disabledFg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
