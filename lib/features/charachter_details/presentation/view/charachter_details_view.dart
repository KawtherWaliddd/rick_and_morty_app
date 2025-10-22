import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/home/data/models/charachter.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/features/charachter_details/presentation/view/widgets/character_info.dart';

class CharachterDetailsView extends StatelessWidget {
  const CharachterDetailsView({super.key, required this.character});
  final Results character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            pinned: true,
            centerTitle: true,
            backgroundColor: AppColors.greyColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.8,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: AppColors.greyColor.withOpacity(0.7)),
                  ],
                ),
                child: Text(
                  character.name!,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              background: Hero(
                tag: character.id!,
                child: Image.network(character.image!, fit: BoxFit.fill),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 1, (
              context,
              index,
            ) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterInfo(
                    title: 'name',
                    value: character.name!,
                    endIndent: MediaQuery.of(context).size.width * 0.85,
                  ),
                  CharacterInfo(
                    title: 'status',
                    value: character.status!,
                    endIndent: MediaQuery.of(context).size.width * 0.84,
                  ),
                  CharacterInfo(
                    title: 'gender',
                    value: character.gender!,
                    endIndent: MediaQuery.of(context).size.width * 0.83,
                  ),
                  CharacterInfo(
                    title: 'species',
                    value: character.species!,
                    endIndent: MediaQuery.of(context).size.width * 0.81,
                  ),
                  CharacterInfo(
                    title: 'created',
                    value: character.created!,
                    endIndent: MediaQuery.of(context).size.width * 0.81,
                  ),
                  SizedBox(height: 500),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
