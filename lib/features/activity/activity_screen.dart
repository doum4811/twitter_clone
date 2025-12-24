import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  static String routeURL = "activity";
  static String routeName = "activity";
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final tabs = ["All", "Replies", "Mentions", "Verified"];

  late final TabController _tabController = TabController(
    length: tabs.length,
    vsync: this,
  );

  // ✅ 더미 데이터 (스크린샷과 유사하게)
  final List<Map<String, dynamic>> _items = [
    {
      "username": "john_mobbin",
      "time": "4h",
      "type": "mention",
      "sub": "Mentioned you",
      "text":
          "Here's a thread you should follow if you love botany @jane_mobbin",
      "button": null,
    },
    {
      "username": "john_mobbin",
      "time": "4h",
      "type": "reply",
      "sub": "Starting out my gardening club with thr...",
      "text": "Count me in!",
      "button": null,
    },
    {
      "username": "the.plantdads",
      "time": "5h",
      "type": "follow",
      "sub": "Followed you",
      "text": "",
      "button": "Following",
    },
    {
      "username": "the.plantdads",
      "time": "5h",
      "type": "like",
      "sub": "Definitely broken! 🧵👀🌱",
      "text": "",
      "button": null,
    },
    {
      "username": "theberryjungle",
      "time": "5h",
      "type": "like",
      "sub": "",
      "text": "🌱👀🧵",
      "button": null,
    },
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // ✅ 캡슐 탭 인디케이터 (선택 탭 검정 배경)
  Decoration _pillIndicator() {
    return BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(6),
    );
  }

  // Widget _tabPill(String text, bool selected) {
  //   return SizedBox(
  //     width: 110, // ✅ 모든 탭 동일한 폭 (100~120 사이 추천)
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(vertical: 10),
  //       decoration: BoxDecoration(
  //         color: selected ? Colors.black : Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //           color: selected ? Colors.black : Colors.grey.shade300,
  //           width: 1,
  //         ),
  //       ),
  //       child: Center(
  //         child: Text(
  //           text,
  //           maxLines: 1,
  //           overflow: TextOverflow.ellipsis, // 안전장치
  //           style: TextStyle(
  //             color: selected ? Colors.white : Colors.black,
  //             fontWeight: FontWeight.w600,
  //             fontSize: 16,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget _tabPill(BuildContext context, String text, bool selected) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    // 다크모드 기준 팔레트
    final selectedBg = isDark ? Colors.white : Colors.black;
    final selectedFg = isDark ? Colors.black : Colors.white;

    final unselectedBg = isDark ? const Color(0xFF1C1C1C) : Colors.white;
    final unselectedFg = isDark ? Colors.white : Colors.black;

    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.18)
        : Colors.grey.shade300;

    return SizedBox(
      width: 110,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? selectedBg : unselectedBg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? Colors.transparent : borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: selected ? selectedFg : unselectedFg,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // ✅ 왼쪽 아바타 + 작은 상태 아이콘(멘션/댓글/팔로우/좋아요)
  Widget _avatarWithBadge(String type) {
    IconData icon;
    Color bg;

    switch (type) {
      case "mention":
        icon = FontAwesomeIcons.threads;
        bg = Colors.green;
        break;
      case "reply":
        icon = FontAwesomeIcons.reply;
        bg = Colors.blue;
        break;
      case "follow":
        icon = FontAwesomeIcons.solidUser;
        bg = Colors.purple;
        break;
      default:
        icon = FontAwesomeIcons.solidHeart;
        bg = Colors.pink;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        const CircleAvatar(
          radius: 26,
          backgroundColor: Color(0xFFEFEFEF),
          child: Icon(Icons.eco, color: Colors.black54),
        ),
        Positioned(
          right: -2,
          bottom: -2,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(child: FaIcon(icon, size: 10, color: Colors.white)),
          ),
        ),
      ],
    );
  }

  // ✅ 오른쪽 버튼 (Following 같은)
  Widget _followButton(String label) {
    final isFollowing = label.toLowerCase() == "following";
    return Container(
      width: 110,
      height: 36,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isFollowing ? Colors.grey.shade400 : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _activityRow(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _avatarWithBadge(item["type"]),
          Gaps.h12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // username + time
                Row(
                  children: [
                    Text(
                      item["username"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Gaps.h8,
                    Text(
                      item["time"],
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                if ((item["sub"] as String).isNotEmpty) ...[
                  Gaps.v4,
                  Text(
                    item["sub"],
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                if ((item["text"] as String).isNotEmpty) ...[
                  Gaps.v6,
                  Text(
                    item["text"],
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (item["button"] != null) ...[
            Gaps.h12,
            _followButton(item["button"]),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,

      // ✅ AppBar 없이 "상단 큰 타이틀"을 body에 직접 (원본이 이 느낌)
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 큰 타이틀
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 12, bottom: 10),
              child: Text(
                "Activity",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  // color: Colors.black,
                ),
              ),
            ),
            // ✅ 캡슐 탭: TabBar를 쓰되, 탭 위젯 자체를 캡슐로 커스텀
            SizedBox(
              height: 46,
              child: AnimatedBuilder(
                animation: _tabController,
                builder: (context, _) {
                  return TabBar(
                    controller: _tabController,
                    isScrollable: true, // 유지 (Threads도 스크롤 가능)
                    indicatorColor: Colors.transparent, // ✅ indicator 안 씀
                    splashFactory: NoSplash.splashFactory,
                    dividerColor: Colors.transparent,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                    tabs: List.generate(tabs.length, (i) {
                      final selected = _tabController.index == i;
                      // return Tab(child: _tabPill(tabs[i], selected));
                      return Tab(child: _tabPill(context, tabs[i], selected));
                    }),
                  );
                },
              ),
            ),
            Gaps.h20,
            // 리스트
            Expanded(
              child: ListView.separated(
                itemCount: _items.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey.shade200,
                  indent: 16 + 52 + 12, // 왼쪽 아바타 너비만큼 밀기
                ),
                itemBuilder: (context, index) => _activityRow(_items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
