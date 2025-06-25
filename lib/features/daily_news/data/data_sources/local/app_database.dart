import 'package:clean_architecture_daily_news/features/daily_news/data/data_sources/local/article_dao.dart';
import 'package:clean_architecture_daily_news/features/daily_news/data/models/article_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDataBase extends FloorDatabase {
  ArticleDao get articleDao;
}
