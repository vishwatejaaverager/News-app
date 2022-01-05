class Article {
  String? title;
  String? urlToImage;

  Article({
    this.title,
    this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> data) {
    final title = data['title'] as String?;
    final description = data['description'] as String?;
    final author = data['author'] as String?;
    final content = data['content'] as String?;
    final urlToImage = data['urlToImage'] as String?;
    final articleUrl = data['urlToImage'] as String?;

    return Article(
      title: title,
      urlToImage: urlToImage,
    );
  }
}
