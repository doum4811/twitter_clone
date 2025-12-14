import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/features/main_navigation/widgets/report_bottom_sheet.dart';

class MoreHorizCard extends StatefulWidget {
  const MoreHorizCard({super.key});

  @override
  State<MoreHorizCard> createState() => _MoreHorizCardState();
}

class _MoreHorizCardState extends State<MoreHorizCard> {
  // void _onClosePressed() {
  //   Navigator.of(context).pop();
  // }

  void _onReportTap() {
    Navigator.of(context).pop();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // barrierColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      useSafeArea: false, // 🔥 위 여백 제거
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      builder: (context) => ReportBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.4,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size16,
            vertical: Sizes.size16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Gaps.v16,
              _OptionCard(
                children: [
                  _OptionItem(label: "Unfollow", onTap: () {}),
                  const Divider(height: 0),
                  _OptionItem(label: "Mute", onTap: () {}),
                ],
              ),

              Gaps.v14,

              _OptionCard(
                children: [
                  _OptionItem(label: "Hide", onTap: () {}),
                  const Divider(height: 0),
                  _OptionItem(
                    label: "Report",
                    isDestructive: true,
                    onTap: _onReportTap,
                  ),
                ],
              ),
            ],
          ),
        ),

        bottomNavigationBar: SizedBox(height: Sizes.size12),
      ),
    );
  }
}

// ---------------------------------------
//  옵션 카드 (WriteScreen 카드 스타일 그대로)
// ---------------------------------------
class _OptionCard extends StatelessWidget {
  final List<Widget> children;

  const _OptionCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}

class _OptionItem extends StatelessWidget {
  final String label;
  final bool isDestructive;
  final VoidCallback onTap;

  const _OptionItem({
    super.key,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 56,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                color: isDestructive ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
