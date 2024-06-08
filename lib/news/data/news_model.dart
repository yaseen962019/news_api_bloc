class Newsmodel {
  String? title;
  String? author;
  String? imageUrl;
  String? time;
  String? url;


  Newsmodel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    time = json['publishedAt'];
    imageUrl = json['urlToImage'];
    url = json['url'];


  }
}