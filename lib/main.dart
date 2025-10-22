import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/home/data/reposatories/charachter_web_services_repo.dart';
import 'package:rick_and_morty/core/web_services/charachter_web_services.dart';
import 'package:rick_and_morty/core/routing/app_router.dart';
import 'package:rick_and_morty/core/utils/strings.dart';

void main() {
  runApp(const RickAndMortyApp());
  CharachterWebServices().getAllCharachters;
  CharachterWebServicesRepo(CharachterWebServices()).getAllCharachters();
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().onGenerateRoute,
      initialRoute: homeView,
    );
  }
}
