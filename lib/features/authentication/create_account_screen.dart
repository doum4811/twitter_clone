import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter_clone/features/authentication/confirmation_code_screen.dart';
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

  bool _isPartTwo = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _nameText = _nameController.text;
      });
    });

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });

      // _setTextFieldDate(initialDate);
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
    return _isNameValid() &&
        _isEmailValid() &&
        _isBirthdayValid(); // && _isEmailValid() == null;
  }

  // void _onNextTap() {
  //   if (!_isButtonEnabled) return;

  //   Navigator.of(context).push(
  //     MaterialPageRoute(builder: (context) => CustomizeExperienceScreen()),
  //   );
  // }
  Future<void> _onNextTap() async {
    if (!_isButtonEnabled) return;

    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (context) => const CustomizeExperienceScreen(),
      ),
    );

    if (result == true && mounted) {
      setState(() {
        _isPartTwo = true;
        _isDatePickerVisible = false;
      });
    }
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

  bool _isBirthdayValid() {
    return _birthdayController.text.isNotEmpty;
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _toggleDatePicker() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isDatePickerVisible = !_isDatePickerVisible;
    });
  }

  void _onSignUpTap() {
    // print("🎉 SIGN UP COMPLETE!");
    // MaterialPageRoute(builder: (context) => ConfirmationCodeScreen());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationCodeScreen(),

        // ConfirmationCodeScreen(email: _formData["email"]),
      ),
    );
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
              style: TextStyle(color: Color(0xFF1D9BF0)),
              controller: _nameController,
              autocorrect: false,
              decoration: InputDecoration(
                suffix: _isNameValid()
                    ? GestureDetector(
                        onTap: () {
                          _nameController.clear();
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.green.shade500,
                          size: Sizes.size20,
                        ),
                      )
                    : const SizedBox.shrink(),
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
              style: TextStyle(color: Color(0xFF1D9BF0)),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              // onEditingComplete: _onSubmit,
              autocorrect: false,
              decoration: InputDecoration(
                suffix: _isEmailValid()
                    ? GestureDetector(
                        onTap: () {
                          _emailController.clear();
                        },
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.green.shade500,
                          size: Sizes.size20,
                        ),
                      )
                    : const SizedBox.shrink(),

                hintText: "Email",

                // errorText: _isEmailValid(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ), //color: Colors.grey.shade400),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,

            GestureDetector(
              onTap: _toggleDatePicker,
              behavior: HitTestBehavior.translucent,
              child: AbsorbPointer(
                child: TextField(
                  style: TextStyle(color: Color(0xFF1D9BF0)),
                  controller: _birthdayController,
                  keyboardType: TextInputType.none,
                  decoration: InputDecoration(
                    suffix: _isBirthdayValid()
                        ? GestureDetector(
                            onTap: () {
                              _birthdayController.clear();
                            },
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green.shade500,
                              size: Sizes.size20,
                            ),
                          )
                        : const SizedBox.shrink(),
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
                fontSize: Sizes.size14,
                color: Colors.grey.shade700,
                // fontWeight: FontWeight.w900,
              ),
              // style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),

      // bottomNavigationBar: SafeArea(
      //   child: SizedBox(
      //     width: double.infinity,
      //     child: _isPartTwo
      //         ? Padding(
      //             padding: const EdgeInsets.symmetric(
      //               horizontal: 24,
      //               vertical: 16,
      //             ),
      //             child: GestureDetector(
      //               onTap: _onSignUpTap,
      //               behavior: HitTestBehavior.translucent,
      //               child: FormButton(disabled: false),
      //             ),
      //           )
      //         : Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               GestureDetector(
      //                 onTap: _isButtonEnabled ? _onNextTap : null,
      //                 behavior: HitTestBehavior.translucent,
      //                 child: FormButton(disabled: !_isButtonEnabled),
      //               ),
      //               AnimatedSize(
      //                 duration: const Duration(milliseconds: 250),
      //                 curve: Curves.easeInOut,
      //                 child: _isDatePickerVisible
      //                     ? SizedBox(
      //                         height: 200,
      //                         width: double.infinity,
      //                         child: CupertinoDatePicker(
      //                           maximumDate: initialDate,
      //                           initialDateTime: initialDate,
      //                           mode: CupertinoDatePickerMode.date,
      //                           onDateTimeChanged: _setTextFieldDate,
      //                         ),
      //                       )
      //                     : const SizedBox.shrink(),
      //               ),
      //             ],
      //           ),
      //   ),
      // ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: _isPartTwo
              // 🔹 Part Two : 파란 Sign up 버튼
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: GestureDetector(
                    onTap: _onSignUpTap,
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D9BF0),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              // 🔹 Part One : Next 버튼 + (필요하면 DatePicker)
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _isButtonEnabled ? _onNextTap : null,
                      behavior: HitTestBehavior.translucent,
                      child: FormButton(disabled: !_isButtonEnabled),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      // vsync: this,
                      child: _isDatePickerVisible
                          ? SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: CupertinoDatePicker(
                                maximumDate: initialDate,
                                initialDateTime: initialDate,
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: _setTextFieldDate,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
