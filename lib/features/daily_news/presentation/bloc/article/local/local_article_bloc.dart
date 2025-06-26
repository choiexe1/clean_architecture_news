import 'package:clean_architecture_daily_news/features/daily_news/domain/use_cases/delete_article_use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/use_cases/get_saved_articles_use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/use_cases/save_article_use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/bloc/article/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  LocalArticleBloc(
    this._deleteArticleUseCase,
    this._getSavedArticlesUseCase,
    this._saveArticleUseCase,
  ) : super(LocalArticlesLoading()) {
    on<GetSavedArticle>(onGetSavedArticles);
    on<DeleteArticle>(onDeleteArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
    GetSavedArticle event,
    Emitter<LocalArticleState> emit,
  ) async {
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onDeleteArticle(
    DeleteArticle event,
    Emitter<LocalArticleState> emit,
  ) async {
    await _deleteArticleUseCase(params: event.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(SaveArticle event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: event.article);
    final articles = await _getSavedArticlesUseCase();
    emit(LocalArticlesDone(articles));
  }
}
