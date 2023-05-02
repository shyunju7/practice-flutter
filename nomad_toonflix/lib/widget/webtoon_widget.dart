import 'package:flutter/material.dart';
import 'package:nomad_toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  // GestureDetector - 동작을 감지하는 위젯
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 웹툰 선택시 디테일 페이지로 이동
        // Navigator.push를 사용하면 애니메이션으로 화면 전환을 느낌
        // Router는 StatelessWidget일 뿐 DetailScreen을 렌더링 함
        // 다른 페이지로 옵션을 함께 전달할 수 있음
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            // fullscreenDialog: true, - dialog 한번에 만들 때
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(2, 2),
                    color: Colors.black.withOpacity(0.2),
                  )
                ],
              ),
              width: 250,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
