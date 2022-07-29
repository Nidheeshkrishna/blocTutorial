import 'package:dio/dio.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/Album/Album.dart';
import 'package:flutter_applicationgoogle_drive/utilities/ExceptionHandling.dart';

class AlbumsRepo {
  Future<List<Album>?> fetchAlbum() async {
    final Dio dio = Dio();

    List<Album>? albums = [];
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/albums',
      );
      final List list = response.data;

      albums = list.map((e) => Album.fromJson(e)).toList();
      // albums = Album.fromJson(response.data).toJson()

      return albums;
    } on DioError catch (e) {
      //throw e.message;
      final errorMessage = DioException.fromDioError(e).toString();
      throw errorMessage.toString();
    } catch (e) {
      print(e);
    }
    return albums;
  }
}

class NoInternetException {
  var message;
  NoInternetException(this.message);
}

class NoServiceFoundException {
  var message;
  NoServiceFoundException(this.message);
}

class InvalidFormatException {
  var message;
  InvalidFormatException(this.message);
}

class UnknownException {
  var message;
  UnknownException(this.message);
}
