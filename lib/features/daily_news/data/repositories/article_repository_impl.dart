import 'dart:io';

import 'package:clean_architecture_daily_news/core/constants/constants.dart';
import 'package:clean_architecture_daily_news/core/resources/result.dart';
import 'package:clean_architecture_daily_news/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_daily_news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture_daily_news/features/daily_news/data/models/article_model.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_architecture_daily_news/features/daily_news/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDataBase _db;

  ArticleRepositoryImpl(this._newsApiService, this._db);

  @override
  Future<Result<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsApiKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return Success(httpResponse.data.articles);
      } else {
        return Failed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return Failed(e);
    }
  }

  @override
  Future<void> deleteArticle(ArticleEntity entity) async {
    return _db.articleDao.deleteArticle(ArticleModel.fromEntity(entity));
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() async {
    return _db.articleDao.getArticles();
  }

  @override
  Future<void> saveArticle(ArticleEntity entity) async {
    return _db.articleDao.insertArticle(ArticleModel.fromEntity(entity));
  }
}
