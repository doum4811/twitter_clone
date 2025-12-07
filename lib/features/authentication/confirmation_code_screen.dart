import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/features/authentication/password_screen.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  // const ConfirmationCodeScreen({super.key});
  final String? email;
  const ConfirmationCodeScreen({super.key, this.email = "noname@gmail.com"});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final List<String> _otpValues = List.filled(6, '');
  bool _isCodeComplete = false;

  void _onNextTap() {
    // print("🎉 SIGN UP COMPLETE!");
    // MaterialPageRoute(builder: (context) => ConfirmationCodeScreen());
    if (!_isCodeComplete) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordScreen(),

        // ConfirmationCodeScreen(email: _formData["email"]),
      ),
    );
  }

  void _handleOtpInput(int index, String value) {
    _otpValues[index] = value;

    final complete = _otpValues.every((v) => v.isNotEmpty);
    setState(() {
      _isCodeComplete = complete;
    });

    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: FaIcon(FontAwesomeIcons.twitter)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'We sent you a code',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Gaps.v24,

              // Text('Enter it below to verify'),
              Text('Enter it below to verify\n${widget.email}'),
              Gaps.v16,
              // OtpCodeInput(controllers: _controllers),
              // SizedBox(
              //   width: 40,
              //   child: TextFormField(
              //     // controller: widget.controllers[index],
              //     maxLength: 1,
              //     keyboardType: TextInputType.number,
              //     textAlign: TextAlign.center,
              //     decoration: const InputDecoration(counterText: ''),
              //   ),
              // ),
              // SizedBox(
              //   width: 40,
              //   child: TextFormField(
              //     // controller: widget.controllers[index],
              //     maxLength: 1,
              //     keyboardType: TextInputType.number,
              //     textAlign: TextAlign.center,
              //     decoration: const InputDecoration(counterText: ''),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SizedBox(
                      width: 40,
                      child: TextFormField(
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(counterText: ''),
                        onChanged: (value) => _handleOtpInput(index, value),
                      ),
                    ),
                  );
                }),
              ),
              Gaps.v24,
              if (_isCodeComplete)
                const Center(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              Gaps.v24,
              Gaps.v4,
              Gaps.v24,
              Gaps.v24,
              Gaps.v80,
              Gaps.v80,
              Gaps.v80,
              Gaps.v80,
              const Text(
                "Didn't receive email?",
                style: TextStyle(fontSize: 14, color: Colors.blue),
              ),
              Gaps.v24,
              // AuthButton(
              //   onTap: _valid ? goToPasswordScreen : verifyOtp,
              //   payload: _valid ? "Next" : "Verify",
              //   isDark: true,
              //   active: isOtpFilled(),
              //   isLoading: _verifying,
              // ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: GestureDetector(
          // behavior: HitTestBehavior.translucent,
          onTap: _isCodeComplete ? _onNextTap : null,
          // onTap: _onNextTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isCodeComplete
                  ? Colors
                        .black //Theme.of(context).primaryColor
                  : Colors.grey.shade400,
              // color: Colors.black,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                // color: Colors.white,
                color: _isCodeComplete ? Colors.white : Colors.black38,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
