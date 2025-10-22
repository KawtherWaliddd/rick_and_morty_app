import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/home/presentation/cubit/characters_cubit.dart';
import 'package:rick_and_morty/features/home/data/models/charachter.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/strings.dart';
import 'package:rick_and_morty/features/home/presentation/view/widget/character_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.yellowColor,
        title: const Text(
          'Characters',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchView);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharactersLoaded) {
            final List<Results> allCharacters = state.characters;

            return Container(
              color: AppColors.greyColor,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: allCharacters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return CharacterItem(character: allCharacters[index]);
                },
              ),
            );
          } else if (state is CharactersFailure) {
            return const Center(child: Text('Failed to load characters 😢'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
