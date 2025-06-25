import 'package:clean_architecture_daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:floor/floor.dart';

class ArticleResponseModel {
  List<ArticleModel> articles;

  ArticleResponseModel({required this.articles});

  factory ArticleResponseModel.fromJson(
    Map<String, dynamic> articleResponseData,
  ) {
    return ArticleResponseModel(
      articles: ((articleResponseData['articles'] ?? []) as List<dynamic>)
          .map((dynamic article) => ArticleModel.fromJson(article))
          .toList(),
    );
  }
}

@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> articleModelData) {
    return ArticleModel(
      author: articleModelData['author'] ?? '',
      title: articleModelData['title'] ?? '',
      description: articleModelData['description'] ?? '',
      url: articleModelData['url'] ?? '',
      urlToImage: articleModelData['urlToImage'] ?? '',
      publishedAt: articleModelData['publishedAt'] ?? '',
      content: articleModelData['content'] ?? '',
    );
  }
}
