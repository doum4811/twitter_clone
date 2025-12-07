import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
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
              Text('Enter it below to verify'),
              // Text('Enter it below to verify\n${widget.email}'),
              const SizedBox(height: 16),
              // OtpCodeInput(controllers: _controllers),
              SizedBox(
                width: 40,
                child: TextFormField(
                  // controller: widget.controllers[index],
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(counterText: ''),
                ),
              ),
              SizedBox(
                width: 40,
                child: TextFormField(
                  // controller: widget.controllers[index],
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(counterText: ''),
                ),
              ),
              Gaps.v24,
              Gaps.v80,
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
          // onTap: _trackingEnabled ? _onNextTap : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: _trackingEnabled
              // ? Colors
              //       .black //Theme.of(context).primaryColor
              // : Colors.grey.shade400,
              color: Colors.black,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                // color: _trackingEnabled ? Colors.white : Colors.black38,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
