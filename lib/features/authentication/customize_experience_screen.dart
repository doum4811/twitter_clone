import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const FaIcon(FontAwesomeIcons.twitter),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),

              const Text(
                "Customize your experience",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 24),

              // 🔹 Text + Switch Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 설명 텍스트 영역
                  Expanded(
                    child: const Text(
                      "Twitter uses this data to personalize your experience. "
                      "This web browsing history will never be stored with your "
                      "name, email, or phone number.",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

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
            ],
          ),
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
              color: _trackingEnabled
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _trackingEnabled ? Colors.white : Colors.black38,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
