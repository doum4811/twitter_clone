import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomizeExperienceScreen extends StatelessWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: FaIcon(FontAwesomeIcons.twitter)));
  }
}
