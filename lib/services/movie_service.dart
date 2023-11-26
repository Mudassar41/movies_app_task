import 'package:task/models/movies_response.dart';
import 'package:task/services/base_api.dart';
import 'package:task/utils/consts.dart';

class MovieService extends BaseApi {
  Future<MoviesResponse> getMovies() async {
   try {
      final response = await getRequest(url: Consts.popularMoviesUrl);
      return MoviesResponse.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }
}
