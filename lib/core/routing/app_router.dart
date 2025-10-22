import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/home/presentation/cubit/characters_cubit.dart';
import 'package:rick_and_morty/features/home/data/models/charachter.dart';
import 'package:rick_and_morty/features/home/data/reposatories/charachter_web_services_repo.dart';
import 'package:rick_and_morty/core/web_services/charachter_web_services.dart';
import 'package:rick_and_morty/core/utils/strings.dart';
import 'package:rick_and_morty/features/charachter_details/presentation/view/charachter_details_view.dart';
import 'package:rick_and_morty/features/home/presentation/view/home_view.dart';
import 'package:rick_and_morty/features/search/presentation/views/search_view.dart';

class AppRouter {
  late final CharachterWebServices charachterWebServices;
  late final CharactersCubit charactersCubit;

  AppRouter() {
    charachterWebServices = CharachterWebServices();
    charactersCubit = CharactersCubit(
      CharachterWebServicesRepo(charachterWebServices),
    );
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => charactersCubit,
            child: const HomeView(),
          ),
        );
      case searchView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => charactersCubit,
            child: const SearchView(),
          ),
        );
      case charachtersDetailsView:
        final character = settings.arguments as Results;
        return MaterialPageRoute(
          builder: (_) => CharachterDetailsView(character: character),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No matching route found')),
          ),
        );
    }
  }
}
