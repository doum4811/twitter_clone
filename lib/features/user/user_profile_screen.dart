import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/features/user/settings_screen.dart';
import 'package:twitter_clone/features/user/widgets/threads_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  static String routeURL = "/profile";
  static String routeName = "profile";

  final String username;
  final String tab = "replies";
  const UserProfileScreen({
    super.key,
    required this.username,
    // required this.tab,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // final List<Map<String, dynamic>> _threads = List.generate(8, (i) {
  //   return {
  //     "username": "jane_mobbin",
  //     "time": "${i + 2}h",
  //     "text": "Reply message #$i",
  //     "avatar": "https://i.pravatar.cc/150?img=${(i % 70) + 10}",
  //     "verified": 0, //i % 2 == 0,
  //     "hasQuote": false, // ✅ 안전
  //   };
  // });
  final List<Map<String, dynamic>> _threads = [
    {
      "username": "jane_mobbin",
      "time": "5h",
      "text":
          "Give @john_mobbin a follow if you want to see more travel content!",
      "avatar": "https://i.pravatar.cc/150?img=10",
      "verified": false,
      "hasQuote": false,
    },
    {
      "username": "jane_mobbin",
      "time": "6h",
      "text": "Tea, spillage",
      "hasQuote": true,
      "quoteUser": "iwetmyyplants",
      "quoteText":
          "I'm just going to say what we are all thinking and knowing is about to go downity down: There is about to be some piping hot tea spillage on here daily that people will be ...",
      "replies": 0,
      "avatar": "https://i.pravatar.cc/150?img=10",
      "quoteAvatar": "https://i.pravatar.cc/150?img=20",
      "verified": false,
    },
  ];

  // final List<Map<String, dynamic>> _replies = List.generate(8, (i) {
  //   return {
  //     "username": "jane_mobbin",
  //     "time": "${i + 1}h",
  //     "text": i == 0 ? "Plant enthusiast!" : "This is a dummy thread post #$i",
  //     "hasQuote": i % 2 == 0,
  //     "quoteUser": "earthpix",
  //     "quoteText":
  //         "What is one place you’re absolutely traveling to by next year?",
  //     "replies": 256 + i,
  //     "avatar": "https://i.pravatar.cc/150?img=${(i % 70) + 1}",
  //     "quoteAvatar": "https://i.pravatar.cc/150?img=${(i % 70) + 20}",
  //     "verified": i % 3 == 0,
  //   };
  // });

  final List<Map<String, dynamic>> _replies = [
    {
      "username": "jane_mobbin",
      "time": "5h",
      "text": "Always a dream to see the Medina in Morocco!",
      "hasQuote": true,
      "quoteUser": "earthpix",
      "quoteText":
          "What is one place you're absolutely traveling to by next year?",
      "replies": "256",
      "avatar": "https://i.pravatar.cc/150?img=10",
      "quoteAvatar": "https://i.pravatar.cc/150?img=30",
      "verified": true,
    },
    {
      "username": "jane_mobbin",
      "time": "5h",
      "text": "See you there",
      "avatar": "https://i.pravatar.cc/150?img=10",
      "verified": false,
      "hasQuote": false,
    },
    // {
    //   "username": "iwetmyyplants",
    //   "time": "6h",
    //   "text": "Tea, spillage",
    //   "hasQuote": true,
    //   "quoteText":
    //       "I'm just going to say what we are all thinking and knowing is about to go downity down: There is about to be some piping hot tea spillage on here daily that people will be ...",
    //   "replies": 0,
    //   "avatar": "https://i.pravatar.cc/150?img=20",
    //   "verified": true,
    // },
  ];

  void _onBarPressed() {
    // Navigator.of(
    //   context,
    // ).push(MaterialPageRoute(builder: (context) => SettingsScreen()));
    context.pushNamed(SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    print("widget.tab: ${widget.tab}");
    return SafeArea(
      child: DefaultTabController(
        // initialIndex: widget.tab == "Replies" ? 0 : 1,
        initialIndex: 1,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScorlled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true, // 프로필은 보통 false가 더 자연스러움
                snap: false, // snap은 floating이 true일 때만 의미있고, 프로필엔 굳이 X
                // backgroundColor: Colors.white,
                elevation: 0,

                expandedHeight: 280,
                leadingWidth: 56,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Icon(
                    FontAwesomeIcons.globe,
                    // color: Colors.black,
                    size: Sizes.size20, // 20,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      // color: Colors.black,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Settings로 이동
                      // Navigator.push(...)
                    },
                    icon: IconButton(
                      onPressed: _onBarPressed,
                      icon: Icon(
                        FontAwesomeIcons.bars,
                        // color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],

                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1) 상단: 이름 + 프로필 이미지
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Jane",
                                      style: TextStyle(
                                        fontSize: 34,
                                        fontWeight: FontWeight.w800,
                                        // color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Text(
                                          "jane_mobbin",
                                          style: TextStyle(
                                            fontSize: 18,
                                            // color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEDEDED),
                                            borderRadius: BorderRadius.circular(
                                              999,
                                            ),
                                          ),
                                          child: const Text(
                                            "threads.net",
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      "Plant enthusiast!",
                                      style: TextStyle(
                                        fontSize: 18,
                                        // color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              CircleAvatar(
                                radius: 34,
                                foregroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/211267733?v=4",
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // 2) 팔로워
                          Row(
                            children: [
                              const CircleAvatar(radius: 10),
                              const SizedBox(width: 6),
                              const Text(
                                "2 followers",
                                style: TextStyle(
                                  // color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          // const SizedBox(height: 16),
                          Gaps.v16,
                          // 3) 버튼 2개 (Edit / Share)
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 44,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Edit profile",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Sizes.size16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(width: 12),
                              Gaps.h12,
                              Expanded(
                                child: Container(
                                  height: 44,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Share profile",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Sizes.size16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SliverPersistentHeader(delegate: ThreadsTabBar(), pinned: true),
            ];
          },

          body: TabBarView(
            children: [
              // Threads
              ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size16,
                ),
                itemCount: _threads.length,
                itemBuilder: (context, index) =>
                    _ThreadCard(item: _threads[index]),
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(
                    left: Sizes.size52,
                  ), // 아바타 아래는 비우기 느낌
                  child: Divider(
                    height: 24,
                    thickness: 1,
                    color: Color(0xFFEDEDED),
                  ),
                ),
              ),

              // Replies
              ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                  vertical: Sizes.size16,
                ),
                itemCount: _replies.length,
                itemBuilder: (context, index) =>
                    _ThreadCard(item: _replies[index]),
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(left: Sizes.size52),
                  child: Divider(
                    height: 24,
                    thickness: 1,
                    color: Color(0xFFEDEDED),
                  ),
                ),
              ),
            ],
          ),

          // body: TabBarView(
          //   children: [
          //     Center(child: Text('Page one')),
          //     Center(child: Text('Page Two')),
          //   ],
          // ),
        ),
      ),
    );
  }
}

class _ThreadCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const _ThreadCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final bool verified = item["verified"] == true;
    final bool hasQuote = item["hasQuote"] == true;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(item["avatar"]),
          backgroundColor: Colors.grey.shade200,
        ),
        Gaps.h12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item["username"] ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  if (verified) ...[
                    Gaps.h6,
                    const Icon(Icons.verified, size: 18, color: Colors.blue),
                  ],
                  const Spacer(),
                  Text(
                    item["time"] ?? "",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Gaps.h10,
                  const Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
              if (item["text"] != null) ...[
                Gaps.v6,
                Text(item["text"], style: const TextStyle(fontSize: 18)),
              ],
              if (hasQuote) ...[
                Gaps.v12,
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: NetworkImage(item["quoteAvatar"]),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item["quoteUser"] ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Gaps.h6,
                                const Icon(
                                  Icons.verified,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            Gaps.v6,
                            Text(
                              item["quoteText"] ?? "",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Gaps.v14,
                            Text(
                              "${item["replies"] ?? 0} replies",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              Gaps.v12,
              Row(
                children: const [
                  Icon(FontAwesomeIcons.heart, size: 20),
                  SizedBox(width: 22),
                  Icon(FontAwesomeIcons.comment, size: 20),
                  SizedBox(width: 22),
                  Icon(FontAwesomeIcons.retweet, size: 20),
                  SizedBox(width: 22),
                  Icon(FontAwesomeIcons.paperPlane, size: 20),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
