import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

final List<Map<String, dynamic>> dummyUsers = [
  {
    "username": "rjmithun",
    "name": "Mithun",
    "followers": "26.6K followers",
    "verified": true,
  },
  {
    "username": "vicenews",
    "name": "VICE News",
    "followers": "301K followers",
    "verified": true,
  },
  {
    "username": "trevornoah",
    "name": "Trevor Noah",
    "followers": "789K followers",
    "verified": true,
  },
  {
    "username": "chef_pillai",
    "name": "Suresh Pillai",
    "followers": "69.2K followers",
    "verified": true,
  },
  {
    "username": "random_user",
    "name": "Random User",
    "followers": "1.2K followers",
    "verified": false,
    "avatar": "https://randomuser.me/api/portraits/women/65.jpg",
  },
];

class SearchScreen extends StatefulWidget {
  static String routeURL = "search";
  static String routeName = "search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController(
    text: "Search",
  );

  void _onSearchChanged(String value) {
    print("Searching form $value");
  }

  void _onSearchSubmitted(String value) {
    print("Submitted $value");
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.white,
        toolbarHeight: 120, // ✅ 이거 없으면 잘림/오버플로우
        titleSpacing: 0, // ✅ 왼쪽 여백 줄이기(선택)
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Search",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  // color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              CupertinoSearchTextField(
                controller: _textEditingController,
                onChanged: _onSearchChanged,
                onSubmitted: _onSearchSubmitted,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.all(16.0),
          //   // padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     // mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Search",
          //         style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          //       ),
          //       CupertinoSearchTextField(
          //         controller: _textEditingController,
          //         onChanged: _onSearchChanged,
          //         onSubmitted: _onSearchSubmitted,
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: ListView.separated(
              // ListView.builder(
              itemCount: dummyUsers.length,
              // itemCount: filtered.length,
              itemBuilder: (context, index) {
                // final user = filtered[index];
                final user = dummyUsers[index];
                return ListTile(
                  // leading: const CircleAvatar(),
                  leading: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: user["avatar"] != null
                        ? NetworkImage(user["avatar"])
                        : null,
                    child: user["avatar"] == null
                        ? Text(
                            user["name"][0],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        : null,
                  ),

                  // title: Text(
                  //   user["username"]!,
                  //   style: const TextStyle(
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user["username"],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      if (user["verified"]) ...[
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 16,
                        ),
                      ],
                    ],
                  ),

                  // subtitle: Text("subtitile"), // Text(user["followers"]!),
                  // // trailing: OutlinedButton(
                  // //   onPressed: () {},
                  // //   child: const Text("Follow"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user["name"], //"Mithun",
                        style: TextStyle(
                          // color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user["followers"], //"26.6K followers",
                        style: TextStyle(
                          // color: Colors.black,
                          // fontWeight: FontWeight.w600,
                          fontSize: 14,
                          //fontSize: 16
                        ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    child: Container(
                      width: Sizes.size96,
                      height: Sizes.size32,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(Sizes.size10),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: Sizes.size1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Follow',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      // child: Center(child: TextStyle('Follow', fontWeight: FontWeight.bold),),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(height: 0, indent: Sizes.size20),
            ),
          ),
        ],
      ),
    );
  }
}
