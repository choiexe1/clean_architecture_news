import 'package:clean_architecture_daily_news/core/resources/result.dart';
import 'package:clean_architecture_daily_news/core/use_cases/use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase implements UseCase<Result<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<Result<List<ArticleEntity>>> call({void params}) async {
    return _articleRepository.getNewsArticles();
  }
}
