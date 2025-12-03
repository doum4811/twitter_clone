import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter_clone/features/authentication/customize_experience_screen.dart';
import 'package:twitter_clone/features/authentication/widgets/form_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  String _nameText = "";
  String _email = "";
  DateTime initialDate = DateTime.now();
  bool _isDatePickerVisible = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _nameText = _nameController.text;
      });
    });

    _emailController.addListener(() {
      // print(_emailController.text);
      setState(() {
        _email = _emailController.text;
      });

      _setTextFieldDate(initialDate);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  // void _onNextTap() {
  //   if (_nameText.isEmpty) return;
  //   if (_email.isEmpty || _isEmailValid() != null) return;
  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => CustomizeExperienceScreen()),
  //   );
  // }
  bool get _isButtonEnabled {
    return _isNameValid() && _isEmailValid(); // && _isEmailValid() == null;
  }

  void _onNextTap() {
    if (!_isButtonEnabled) return;

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CustomizeExperienceScreen()),
    );
  }

  // String? _isEmailValid() {
  //   if (_email.isEmpty) return null;
  //   final regExp = RegExp(
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  //   );

  //   if (!regExp.hasMatch(_email)) {
  //     return "Not valid";
  //   }
  //   return null;
  // }
  bool _isEmailValid() {
    return _email.isNotEmpty; // && _nameText.length > 1;
    // setState(() {});
  }

  bool _isNameValid() {
    return _nameText.isNotEmpty; // && _nameText.length > 1;
    // setState(() {});
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _toggleDatePicker() {
    FocusScope.of(context).unfocus(); // 키보드/포커스 제거
    setState(() {
      _isDatePickerVisible = !_isDatePickerVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: FaIcon(FontAwesomeIcons.twitter)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            Text(
              "Create your account",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w900,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _nameController,
              autocorrect: false,
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      // onTap: _nameTextTap,
                      child: // FaIcon(FontAwesomeIcons.solidCircleCheck),
                      FaIcon(
                        _isNameValid()
                            ? FontAwesomeIcons.solidCircleCheck
                            : null,
                        color: Colors.green.shade500,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                hintText: "Name",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              // onEditingComplete: _onSubmit,
              autocorrect: false,
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      // onTap: _nameTextTap,
                      child: // FaIcon(FontAwesomeIcons.solidCircleCheck),
                      FaIcon(
                        _isEmailValid()
                            ? FontAwesomeIcons.solidCircleCheck
                            : null,
                        color: Colors.green.shade500,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),

                hintText: "Email",

                // errorText: _isEmailValid(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF4693db),
                  ), //color: Colors.grey.shade400),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            // GestureDetector(
            //   onTap: _toggleDatePicker,
            //   child: TextField(
            //     // enabled: false,
            //     // controller: _birthdayController,
            //     decoration: InputDecoration(
            //       hintText: "Date of birth",
            //       enabledBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey.shade400),
            //       ),
            //       focusedBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey.shade400),
            //       ),
            //     ),
            //     cursorColor: Theme.of(context).primaryColor,
            //   ),
            // ),
            GestureDetector(
              onTap: _toggleDatePicker,
              behavior: HitTestBehavior.translucent,
              child: AbsorbPointer(
                child: TextField(
                  controller: _birthdayController,
                  keyboardType: TextInputType.none, // 키보드 안 뜨게!
                  decoration: InputDecoration(
                    hintText: "Date of birth",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Gaps.v16,
            Text(
              'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
              style: TextStyle(
                fontSize: Sizes.size16 + Sizes.size1,
                color: Colors.grey.shade700,
                // fontWeight: FontWeight.w900,
              ),
              // style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // AnimatedCrossFade(
            //   duration: const Duration(milliseconds: 250),
            //   crossFadeState: _isDatePickerVisible
            //       ? CrossFadeState.showSecond
            //       : CrossFadeState.showFirst,
            //   firstChild: const SizedBox.shrink(), // 접힘 상태
            //   secondChild: SizedBox(
            //     height: 200,
            //     child: CupertinoDatePicker(
            //       maximumDate: initialDate,
            //       initialDateTime: initialDate,
            //       mode: CupertinoDatePickerMode.date,
            //       onDateTimeChanged: _setTextFieldDate,
            //     ),
            //   ),
            // ),
            // // Gaps.v10,

            // GestureDetector(child: FormButton(disabled: !_isPasswordValid())),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   height: 300,
      //   child: SizedBox(
      //     child: CupertinoDatePicker(
      //       maximumDate: initialDate,
      //       initialDateTime: initialDate,
      //       mode: CupertinoDatePickerMode.date,
      //       onDateTimeChanged: _setTextFieldDate,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔹 Next Button (항상 있음)
            // Padding(
            //   padding: const EdgeInsets.only(right: 24, bottom: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       TextButton(
            //         onPressed: null,
            //         style: TextButton.styleFrom(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 24,
            //             vertical: 12,
            //           ),
            //           backgroundColor: Colors.grey.shade300,
            //           foregroundColor: Colors.white,
            //           shape: const StadiumBorder(),
            //         ),
            //         child: const Text(
            //           "Next",
            //           style: TextStyle(fontWeight: FontWeight.w600),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // GestureDetector(
            //   onTap: _onNextTap,
            //   child: FormButton(disabled: false),
            // ),
            GestureDetector(
              onTap: _isButtonEnabled ? _onNextTap : null,
              behavior: HitTestBehavior.translucent,
              child: FormButton(disabled: !_isButtonEnabled),
            ),

            // 🔹 DatePicker (펼침/접힘)
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              crossFadeState: _isDatePickerVisible
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  maximumDate: initialDate,
                  initialDateTime: initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: _setTextFieldDate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
