import 'package:the_movie_db/redux/state/app_state.dart';
import 'package:the_movie_db/redux/reducers/images_config_reducer.dart';
import 'package:the_movie_db/redux/reducers/movie_list_loading_reducer.dart';
import 'package:the_movie_db/redux/reducers/movie_list_reducer.dart';
import 'package:the_movie_db/redux/reducers/movie_detail_reducer.dart';
import 'package:the_movie_db/redux/reducers/casts_of_movie_reducer.dart';

AppState rootReducer(AppState prev, dynamic action) {
  return AppState(
    imagesConfig: imagesConfigReducer(prev.imagesConfig, action),
    moviesDownloading: movieListLoadingReducer(prev.moviesDownloading, action),
    homeMovies: movieListReducer(prev.homeMovies, action),
    movieDetailState: movieDetailStateReducer(prev.movieDetailState, action),
    castsOfSpecifiedMovie:
        castsOfMovieReducer(prev.castsOfSpecifiedMovie, action),
  );
}
