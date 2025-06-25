import 'package:clean_architecture_daily_news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:clean_architecture_daily_news/features/daily_news/presentation/widgets/article_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  _buildAppBar() {
    return AppBar(
      title: Text('Daily News', style: TextStyle(color: Colors.black)),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        switch (state) {
          case RemoteArticlesLoading():
            return Center(child: CupertinoActivityIndicator());
          case RemoteArticlesDone():
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleWidget(article: state.articles![index]);
              },
              itemCount: state.articles!.length,
            );
          case RemoteArticlesError():
            return Center(child: Icon(Icons.refresh));
        }
      },
    );
  }
}
