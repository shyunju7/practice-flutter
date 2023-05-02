import 'package:flutter/material.dart';
import 'package:nomad_toonflix/models/webtoon_detail_model.dart';
import 'package:nomad_toonflix/models/webtoon_episode_model.dart';
import 'package:nomad_toonflix/services/api_service.dart';
import 'package:nomad_toonflix/widget/episode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  // _DetailScreenState에 property 전달
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  // 디바이스 내부 저장소에 좋아요 목록 저장
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initSHaredPreferences() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList("likedToons");

    if (likedToons != null) {
      if (likedToons.contains(widget.id)) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      prefs.setStringList('likedToons', []);
    }
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList("likedToons");

    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList("likedToons", likedToons);

      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    // 부모가 가지고 있는 state를 가져오기 위해
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodeById(widget.id);
    initSHaredPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink,
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border_rounded,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        elevation: 1,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.id,
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
                      widget.thumb,
                      headers: const {
                        "User-Agent":
                            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder(
              future: webtoon,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.about,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "${snapshot.data!.genre} / ${snapshot.data!.age}",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  );
                }
                return const Text("...");
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: episodes,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // ListView는 여러 가지 요소를 다룰 때 복잡한 구조가 됨으로
                  // Column으로 구현
                  return Column(
                    children: [
                      // collection for
                      for (var epsiode in snapshot.data!)
                        Episode(
                          epsiode: epsiode,
                          webtoonId: widget.id,
                        ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
