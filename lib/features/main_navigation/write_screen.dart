// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:twitter_clone/constants/gaps.dart';
// import 'package:twitter_clone/constants/sizes.dart';

// class WriteScreen extends StatefulWidget {
//   const WriteScreen({super.key});

//   @override
//   State<WriteScreen> createState() => _WriteScreenState();
// }

// class _WriteScreenState extends State<WriteScreen> {
//   bool _isWriting = false;

//   final ScrollController _scrollController = ScrollController();

//   void _onClosePressed() {
//     Navigator.of(context).pop();
//   }

//   void _stopWriting() {
//     FocusScope.of(context).unfocus();
//     setState(() {
//       _isWriting = false;
//     });
//   }

//   void _onStartWriting() {
//     setState(() {
//       _isWriting = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // bottomSheet의 크기를 키우고 싶음
//     final size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.95,
//       clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(Sizes.size14),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.grey.shade50,
//         appBar: AppBar(
//           backgroundColor: Colors.grey.shade50,

//           automaticallyImplyLeading: false,
//           title: Text("New thread"),
//           actions: [
//             // IconButton(
//             //   onPressed: _onClosePressed,
//             //   icon: FaIcon(FontAwesomeIcons.xmark),
//             // ),
//             Padding(padding: const EdgeInsets.all(8.0), child: Text("Cancel")),
//           ],
//         ),
//         body: GestureDetector(
//           onTap: _stopWriting,
//           child: Stack(
//             children: [
//               // Scrollbar(
//               //   controller: _scrollController,
//               //   child: ListView.separated(
//               //     controller: _scrollController,

//               //     padding: EdgeInsets.only(
//               //       top: Sizes.size10,
//               //       bottom: Sizes.size96 + Sizes.size20,
//               //       left: Sizes.size16,
//               //       right: Sizes.size16,
//               //     ),
//               //     separatorBuilder: (context, index) => Gaps.v20,
//               //     itemCount: 10,
//               //     itemBuilder: (context, index) => Row(
//               //       crossAxisAlignment: CrossAxisAlignment.start,
//               //       children: [
//               //         CircleAvatar(radius: 18, child: Text("니꼬")),
//               //         Gaps.h10,
//               //         Expanded(
//               //           child: Column(
//               //             crossAxisAlignment: CrossAxisAlignment.start,
//               //             children: [
//               //               Text(
//               //                 '니꼬',
//               //                 style: TextStyle(
//               //                   fontWeight: FontWeight.bold,
//               //                   fontSize: Sizes.size14,
//               //                   color: Colors.grey.shade500,
//               //                 ),
//               //               ),
//               //               Gaps.v3,
//               //               Text(
//               //                 "That's not it I've seen the same thing but also in a cave,",
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //         Gaps.h10,
//               //         Column(
//               //           children: [
//               //             FaIcon(
//               //               FontAwesomeIcons.heart,
//               //               size: Sizes.size20,
//               //               color: Colors.grey.shade500,
//               //             ),
//               //             Gaps.v2,
//               //             Text(
//               //               '52.2K',
//               //               style: TextStyle(color: Colors.grey.shade500),
//               //             ),
//               //           ],
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               Row(
//                 children: [
//                   CircleAvatar(radius: 18, child: Text("니꼬")),
//                   Text(
//                     'jane_mobbin',
//                     style: TextStyle(
//                       // fontWeight: FontWeight.bold,
//                       fontSize: Sizes.size20,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Gaps.h10,
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Gaps.v3,
//                         Expanded(
//                           child: SizedBox(
//                             height: Sizes.size44,
//                             child: TextField(
//                               onTap: _onStartWriting,
//                               expands: true,
//                               minLines: null,
//                               maxLines: null,
//                               textInputAction: TextInputAction.newline,
//                               cursorColor: Theme.of(context).primaryColor,
//                               decoration: InputDecoration(
//                                 hintText: "Start a thread...",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(
//                                     Sizes.size12,
//                                   ),
//                                   borderSide: BorderSide.none,
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.grey.shade200,
//                                 contentPadding: EdgeInsets.symmetric(
//                                   // vertical: Sizes.size12,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 bottom: 0,
//                 width: size.width,
//                 child: BottomAppBar(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: Sizes.size16,
//                       vertical: Sizes.size10,
//                     ),
//                     child: Row(
//                       children: [
//                         //   child: SizedBox(
//                         //     height: Sizes.size44,
//                         //     child: TextField(
//                         //       onTap: _onStartWriting,
//                         //       expands: true,
//                         //       minLines: null,
//                         //       maxLines: null,
//                         //       textInputAction: TextInputAction.newline,
//                         //       cursorColor: Theme.of(context).primaryColor,
//                         //       decoration: InputDecoration(
//                         //         hintText: "Add comment...",
//                         //         border: OutlineInputBorder(
//                         //           borderRadius: BorderRadius.circular(
//                         //             Sizes.size12,
//                         //           ),
//                         //           borderSide: BorderSide.none,
//                         //         ),
//                         //         filled: true,
//                         //         fillColor: Colors.grey.shade200,
//                         //         contentPadding: EdgeInsets.symmetric(
//                         //           // vertical: Sizes.size12,
//                         //         ),
//                         //         suffixIcon: Padding(
//                         //           padding: EdgeInsetsGeometry.only(
//                         //             right: Sizes.size14,
//                         //           ),
//                         //           child: Row(
//                         //             mainAxisSize: MainAxisSize.min,
//                         //             children: [
//                         //               Text(
//                         //                 "Anyone can reply",
//                         //                 style: TextStyle(
//                         //                   color: Colors.grey.shade500,
//                         //                   fontSize: Sizes.size20,
//                         //                   // fontWeight: FontWeight.w700,
//                         //                 ),
//                         //               ),
//                         //               // FaIcon(
//                         //               //   FontAwesomeIcons.at,
//                         //               //   color: Colors.grey.shade900,
//                         //               // ),
//                         //               // Gaps.h14,
//                         //               // FaIcon(
//                         //               //   FontAwesomeIcons.gift,
//                         //               //   color: Colors.grey.shade900,
//                         //               // ),
//                         //               // Gaps.h14,
//                         //               // FaIcon(
//                         //               //   FontAwesomeIcons.faceSmile,
//                         //               //   color: Colors.grey.shade900,
//                         //               // ),
//                         //               Gaps.h60,
//                         //               if (_isWriting)
//                         //                 GestureDetector(
//                         //                   onTap: _stopWriting,
//                         //                   child: Text(
//                         //                     "Post",
//                         //                     style: TextStyle(
//                         //                       color: Theme.of(
//                         //                         context,
//                         //                       ).primaryColor,
//                         //                       fontSize: Sizes.size20,
//                         //                       fontWeight: FontWeight.w700,
//                         //                     ),
//                         //                   ),
//                         //                   // FaIcon(
//                         //                   //   FontAwesomeIcons.circleArrowUp,
//                         //                   //   color: Theme.of(
//                         //                   //     context,
//                         //                   //   ).primaryColor,
//                         //                   // ),
//                         //                 ),
//                         //             ],
//                         //           ),
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ),
//                         // ),
//                         Expanded(
//                           child: SizedBox(
//                             height: Sizes.size44,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 // 왼쪽: 누구나 답글 가능 텍스트
//                                 Text(
//                                   "Anyone can reply",
//                                   style: TextStyle(
//                                     color: Colors.grey.shade500,
//                                     fontSize: Sizes.size16,
//                                   ),
//                                 ),

//                                 // 오른쪽: Post 버튼
//                                 if (_isWriting)
//                                   GestureDetector(
//                                     onTap:
//                                         _stopWriting, // 나중에 실제 post 함수로 바꾸면 됨
//                                     child: Text(
//                                       "Post",
//                                       style: TextStyle(
//                                         color: Theme.of(context).primaryColor,
//                                         fontSize: Sizes.size16,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  bool _isWriting = false;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _textController.text.trim().isNotEmpty;
    if (hasText != _isWriting) {
      setState(() {
        _isWriting = hasText;
      });
    }
  }

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
  }

  void _onPostTap() {
    if (!_isWriting) return;
    // TODO: 실제 게시 로직 추가
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // bottomSheet의 크기를 키우고 싶음
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.95,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          leadingWidth: 80,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: TextButton(
            onPressed: _onClosePressed,
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          title: const Text(
            "New thread",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              // 본문 영역
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 아바타
                    // const CircleAvatar(radius: 20, child: Text("니꼬")),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/211267733?v=4",
                      ),
                    ),
                    Gaps.h10,
                    // 아이디 + 입력창
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'jane_mobbin',
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Gaps.v10,
                          TextField(
                            controller: _textController,
                            autofocus: true,
                            minLines: 1,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                              hintText: "Start a thread...",
                              border: InputBorder.none,
                              isCollapsed: false,
                            ),
                          ),
                          // 필요하면 아래에 첨부 아이콘/세로선 추가할 수 있음
                          Gaps.v10,

                          // 클립 아이콘
                          GestureDetector(
                            onTap: () {
                              // TODO: 이미지 첨부 로직 넣기
                            },
                            child: FaIcon(
                              FontAwesomeIcons.paperclip,
                              size: 18,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 하단 Anyone / Post 영역
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  color: Colors.white,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                      vertical: Sizes.size10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // 왼쪽: Anyone can reply
                                Text(
                                  "Anyone can reply",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: Sizes.size14,
                                  ),
                                ),
                                // 오른쪽: Post 버튼 (활성/비활성)
                                GestureDetector(
                                  onTap: _onPostTap,
                                  child: Text(
                                    "Post",
                                    style: TextStyle(
                                      color: _isWriting
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey.shade400,
                                      fontSize: Sizes.size16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
