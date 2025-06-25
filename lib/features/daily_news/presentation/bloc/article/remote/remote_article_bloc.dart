import 'package:clean_architecture_daily_news/core/resources/result.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
    GetArticles event,
    Emitter<RemoteArticleState> emit,
  ) async {
    final result = await _getArticleUseCase();

    if (result is Success && result.data!.isNotEmpty) {
      emit(RemoteArticlesDone(result.data!));
    }

    if (result is Failed) {
      emit(RemoteArticlesError(result.error!));
    }
  }
}
