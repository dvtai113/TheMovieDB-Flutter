import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:the_movie_db/app_routes.dart';
import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:the_movie_db/redux/reducers/root_reducer.dart';
import 'package:the_movie_db/redux/middlewares/load_initial_data_middleware.dart';
import 'package:the_movie_db/redux/middlewares/load_movie_list_middleware.dart';
import 'package:the_movie_db/redux/middlewares/load_movie_detail_middleware.dart';
import 'package:the_movie_db/redux/middlewares/load_casts_of_movie_middleware.dart';

void main() => runApp(ReduxApp());

class ReduxApp extends StatelessWidget {
  final reduxStore = Store<AppState>(
    rootReducer,
    initialState: AppState.loading(),
    middleware: []
      ..addAll(createInitialDataMiddleware())
      ..addAll(createLoadMovieListMiddleware())
      ..addAll(createLoadMovieDetailMiddleware())
      ..addAll(createLoadCastsOfMovieMiddleware()),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: reduxStore,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _appTheme(context),
        routes: AppRoutes.create(),
      ),
    );
  }
}

ThemeData _appTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0D1C34),
      backgroundColor: Color(0xFF161D29),
      accentColor: Color(0xFFF9473A),
      textTheme: Theme
          .of(context)
          .textTheme
          .copyWith(body1: new TextStyle(color: Colors.white)));
}
