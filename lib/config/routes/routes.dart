import 'package:clean_architecture_daily_news/features/daily_news/domain/entities/article_entity.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/pages/article_detail/article_detail.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/pages/saved_article/saved_article.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(
          ArticleDetailsView(article: settings.arguments as ArticleEntity),
        );

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
