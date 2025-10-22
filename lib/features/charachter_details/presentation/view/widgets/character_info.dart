import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/utils/app_colors.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({
    super.key,
    required this.title,
    required this.value,
    required this.endIndent,
  });
  final String title, value;
  final double endIndent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RichText(
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
                TextSpan(
                  text: value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            endIndent: endIndent,
            height: 30,
            thickness: 3,
            color: AppColors.yellowColor,
          ),
        ],
      ),
    );
  }
}
