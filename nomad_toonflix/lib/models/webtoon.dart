class WebtoonModel {
  final String title, thumb, id;

// 받아온 API 데이터를 통해 초기화 해주는 작업
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}
