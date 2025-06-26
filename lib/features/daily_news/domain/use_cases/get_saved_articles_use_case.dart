import 'package:clean_architecture_daily_news/core/use_cases/use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/repositories/article_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  const GetSavedArticlesUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) async {
    return _articleRepository.getSavedArticles();
  }
}
