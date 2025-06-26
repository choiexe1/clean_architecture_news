import 'package:clean_architecture_daily_news/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_daily_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_daily_news/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/repositories/article_repository.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/use_cases/get_article_use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/use_cases/get_saved_articles_use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/use_cases/save_article_use_case.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDataBase
      .databaseBuilder('app_database.db')
      .build();

  sl.registerSingleton<AppDataBase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Data Sources
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // Repositories
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // Use Cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
