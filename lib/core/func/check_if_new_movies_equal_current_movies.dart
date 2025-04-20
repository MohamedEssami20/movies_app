// create method that check if current movies equal new movies;
import '../../features/home/domain/entities/base_movies_entity.dart';

bool checkIfCurrentMoviesEqualNewMovies<T extends BaseMoviesEntity>(
    List<T> currentMovies, List<T> newMovies) {
  if (currentMovies.isEmpty || newMovies.isEmpty) {
    // firsr start app;
    return false;
  }
  for (int counter = 0;
      counter < currentMovies.length && counter < newMovies.length;
      counter++) {
    if (currentMovies[counter].baseMoviesId !=
        newMovies[counter].baseMoviesId) {
      return false;
    } // check if current movies equal new movies;
  }
  return true;
}
