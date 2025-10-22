import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/home/presentation/cubit/characters_cubit.dart';
import 'package:rick_and_morty/features/home/data/models/charachter.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/home/presentation/view/widget/character_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Results> allCharacters = [];
  List<Results> searchedCharacters = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }


  void _search(String value) {
    setState(() {
      searchText = value;
      searchedCharacters = allCharacters
          .where(
            (character) =>
                character.name!.toLowerCase().startsWith(value.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        backgroundColor: AppColors.yellowColor,
        title: TextField(
          onChanged: _search,
          cursorColor: AppColors.greyColor,
          decoration: InputDecoration(
            hintText: 'Search for character',
            hintStyle: const TextStyle(fontSize: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.yellowColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.yellowColor),
            ),
          ),
        ),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharactersLoaded) {
            allCharacters = state.characters;

            // nothing show if user don't enter letters
            if (searchText.isEmpty) {
              return Center(
                child: Text(
                  "please enter character",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                ),
              );
            }

            if (searchedCharacters.isEmpty) {
              return Center(
                child: Text(
                  "No character matched",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              itemCount: searchedCharacters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CharacterItem(character: searchedCharacters[index]),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(color: AppColors.whiteColor),
              ),
            );
          }
        },
      ),
    );
  }
}
