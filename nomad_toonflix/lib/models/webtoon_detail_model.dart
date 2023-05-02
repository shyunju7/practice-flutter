class WebtoonDetailModel {
  final String title, about, genre, age;

  // json으로 변환
  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
