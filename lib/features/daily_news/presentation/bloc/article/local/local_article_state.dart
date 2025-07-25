import 'package:clean_architecture_daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:equatable/equatable.dart';

sealed class LocalArticleState extends Equatable {
  final List<ArticleEntity>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles!];
}

class LocalArticlesLoading extends LocalArticleState {
  const LocalArticlesLoading();
}

class LocalArticlesDone extends LocalArticleState {
  const LocalArticlesDone(List<ArticleEntity> articles)
    : super(articles: articles);
}
