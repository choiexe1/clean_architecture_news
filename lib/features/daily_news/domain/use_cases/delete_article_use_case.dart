import 'package:clean_architecture_daily_news/core/use_cases/use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/repositories/article_repository.dart';

class DeleteArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  const DeleteArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) async {
    return _articleRepository.deleteArticle(params!);
  }
}
