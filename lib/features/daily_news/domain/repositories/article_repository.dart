import 'package:clean_architecture_daily_news/core/resources/result.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/entities/article_entity.dart';

abstract interface class ArticleRepository {
  Future<Result<List<ArticleEntity>>> getNewsArticles();
}
