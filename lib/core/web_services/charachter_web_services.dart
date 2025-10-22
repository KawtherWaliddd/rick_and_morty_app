import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/utils/strings.dart';

class CharachterWebServices {
  late Dio dio;
  CharachterWebServices() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: Duration(seconds: 5),
      connectTimeout: Duration(seconds: 5),
      receiveDataWhenStatusError: true,
      baseUrl: baseUrl,
    );
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharachters() async {
    try {
      Response response = await dio.get(characterEndpoint);
      final characters = response.data['results'];
      return characters;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
