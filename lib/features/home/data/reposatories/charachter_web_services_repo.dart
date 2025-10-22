import 'package:rick_and_morty/features/home/data/models/charachter.dart';
import 'package:rick_and_morty/core/web_services/charachter_web_services.dart';

class CharachterWebServicesRepo {
  final CharachterWebServices charachterWebServices;

  CharachterWebServicesRepo(this.charachterWebServices);
  Future<List<Results>> getAllCharachters() async {
    final charachters = await charachterWebServices.getAllCharachters();
    return charachters
        .map((charachter) => Results.fromJson(charachter))
        .toList();
  }
}
