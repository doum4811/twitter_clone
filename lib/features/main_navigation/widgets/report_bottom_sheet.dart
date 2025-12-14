// import 'package:flutter/material.dart';
// import 'package:twitter_clone/constants/gaps.dart';
// import 'package:twitter_clone/constants/sizes.dart';

// class ReportBottomSheet extends StatelessWidget {
//   const ReportBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final reasons = [
//       "I just don't like it",
//       "It's unlawful content under NetzDG",
//       "It's spam",
//       "Hate speech or symbols",
//       "Nudity or sexual activity",
//       "False information",
//     ];

//     return Container(
//       height: size.height * 0.70,
//       clipBehavior: Clip.hardEdge,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(Sizes.size14),
//         color: Colors.white,
//       ),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade400,
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             // Gaps.v12,

//             // 실제 카드
//             Container(
//               width: double.infinity,
//               clipBehavior: Clip.hardEdge,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(Sizes.size16),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // 헤더
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: Sizes.size16,
//                       horizontal: Sizes.size20,
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Report",
//                         style: const TextStyle(
//                           fontSize: Sizes.size20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),

//                   // 안내 문구
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: Sizes.size20,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "Why are you reporting this thread?",
//                           style: TextStyle(
//                             fontSize: Sizes.size20,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Gaps.v8,
//                         Text(
//                           "Your report is anonymous, except if you're "
//                           "reporting an intellectual property infringement. "
//                           "If someone is in immediate danger, call the local "
//                           "emergency services — don't wait.",
//                           style: TextStyle(
//                             fontSize: Sizes.size16,
//                             color: Colors.black54,
//                             height: 1.4,
//                           ),
//                         ),
//                         Gaps.v12,
//                       ],
//                     ),
//                   ),

//                   // 신고 사유 리스트 (ListTile 사용)
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: List.generate(reasons.length, (index) {
//                       final reason = reasons[index];
//                       final isLast = index == reasons.length - 1;

//                       return Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           ListTile(
//                             title: Text(
//                               reason,
//                               style: const TextStyle(
//                                 fontSize: Sizes.size16,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             trailing: const Icon(
//                               Icons.chevron_right,
//                               size: Sizes.size16,
//                               color: Colors.black54,
//                             ),
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                           if (!isLast)
//                             const Divider(height: 0, indent: Sizes.size20),
//                         ],
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const reasons = [
      "I just don't like it",
      "It's unlawful content under NetzDG",
      "It's spam",
      "Hate speech or symbols",
      "Nudity or sexual activity",
      "False information",
    ];

    return Container(
      height: size.height * 0.7, // 필요하면 0.4 ~ 0.6 사이로 조절
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
            vertical: Sizes.size10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 핸들바
              const SizedBox(height: 4),
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Gaps.v20,

              // 헤더
              Center(
                child: Text(
                  "Report",
                  style: const TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),

              Gaps.v10,
              Divider(height: 0, indent: Sizes.size2),
              Gaps.v10,
              // 안내 문구
              const Text(
                "Why are you reporting this thread?",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Gaps.v8,
              const Text(
                "Your report is anonymous, except if you're "
                "reporting an intellectual property infringement. "
                "If someone is in immediate danger, call the local "
                "emergency services — don't wait.",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              Gaps.v16,

              // 신고 사유 리스트
              Expanded(
                child: ListView.separated(
                  itemCount: reasons.length,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 0, indent: Sizes.size20),
                  itemBuilder: (context, index) {
                    final reason = reasons[index];
                    return ListTile(
                      title: Text(
                        reason,
                        style: const TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.black,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: Sizes.size16,
                        color: Colors.black54,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
