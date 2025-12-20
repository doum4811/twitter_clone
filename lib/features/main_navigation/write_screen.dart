import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/main_navigation/carmera_screen.dart';
import 'package:twitter_clone/utils.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  bool _isWriting = false;

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  File? _attachedImage;

  Future<void> _onAttachmentTap() async {
    final File? file = await Navigator.of(context).push<File?>(
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
        fullscreenDialog: true, // iOS 느낌(모달)
      ),
    );

    if (file == null) return;
    setState(() => _attachedImage = file);
  }

  void _onRemoveAttachedImage() {
    setState(() => _attachedImage = null);
  }

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
    final isDark = isDarkMode(context);
    // bottomSheet의 크기를 키우고 싶음
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.95,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        // backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          // backgroundColor: Colors.grey.shade50, ////
          leadingWidth: 80,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: TextButton(
            onPressed: _onClosePressed,
            child: Text(
              "Cancel",
              style: TextStyle(
                color: isDarkMode(context) ? Colors.white70 : Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          title: const Text(
            "New thread",
            style: TextStyle(
              // color: Colors.black,
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
                              // color: Colors.black,
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
                            // onTap: () {
                            //   // TODO: 이미지 첨부 로직 넣기
                            // },
                            onTap: _onAttachmentTap,
                            child: FaIcon(
                              FontAwesomeIcons.paperclip,
                              size: 18,
                              color: Colors.grey.shade500,
                            ),
                          ),

                          // ✅ 첨부 이미지 미리보기 (WriteScreen에 표시)
                          if (_attachedImage != null)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 10,
                                      child: Image.file(
                                        _attachedImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: GestureDetector(
                                      onTap: _onRemoveAttachedImage,
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: const BoxDecoration(
                                          color: Colors.black54,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                  // color: Colors.white,
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
