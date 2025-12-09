import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class Post {
  final String userName;
  final String avatarUrl;
  final bool isPremium;
  final String content;
  final List<String> imageUrls; // 비어 있으면 텍스트 글
  final String time;
  final int replies;
  final int likes;

  const Post({
    required this.userName,
    required this.avatarUrl,
    required this.isPremium,
    required this.content,
    required this.imageUrls,
    required this.time,
    required this.replies,
    required this.likes,
  });

  bool get hasImages => imageUrls.isNotEmpty;
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 왼쪽 아바타 + 세로 라인
          Column(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(post.avatarUrl),
              ),
              Gaps.v8,

              Container(
                width: 2,
                height: post.hasImages ? 190 : 90, // 대략적인 높이
                color: Colors.grey.withValues(alpha: 0.3),
              ),
            ],
          ),
          Gaps.h12,
          // 오른쪽 내용
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(post: post),
                Gaps.v4,
                Text(post.content, style: const TextStyle(fontSize: 14)),
                if (post.hasImages) ...[
                  Gaps.v8,
                  _PostImages(imageUrls: post.imageUrls),
                ],
                Gaps.v8,
                // _ActionsRow(),
                Gaps.v8,
                Text(
                  "${post.replies} replies · ${post.likes} likes",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostImages extends StatelessWidget {
  final List<String> imageUrls;

  const _PostImages({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // aspectRatio: 4 / 5, // Threads 느낌나는 세로 사진 비율
      aspectRatio: 6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: PageView(
          children: [
            for (final url in imageUrls) Image.network(url, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Post post;

  const _Header({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          post.userName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size14,
          ),
        ),
        const SizedBox(width: 4),
        // const Icon(Icons.check_circle, size: Sizes.size14, color: Colors.blue),
        post.isPremium
            ? FaIcon(
                FontAwesomeIcons.circleCheck,
                size: Sizes.size14,
                color: Colors.blue,
              )
            : const SizedBox.shrink(),

        const Spacer(),
        Text(
          post.time,
          style: TextStyle(fontSize: Sizes.size12, color: Colors.grey.shade600),
        ),
        const SizedBox(width: Sizes.size4),
        const Icon(Icons.more_horiz, size: Sizes.size16),
      ],
    );
  }
}
