import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rick_and_morty/features/home/data/models/charachter.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';
import 'package:rick_and_morty/core/utils/strings.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final Results character;

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height * 0.28;

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        charachtersDetailsView,
        arguments: character,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: character.image ?? '',
                height: imageHeight,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: Lottie.asset('assets/images/Loading.json')),
                errorWidget: (context, url, error) => Container(
                  height: imageHeight,
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                character.name ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
