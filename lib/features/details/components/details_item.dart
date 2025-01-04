import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_lesson/config/app_colors.dart';
import 'package:rick_and_morty_lesson/config/theme.dart';

class DetailsItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;

  static const double _iconSize = 40;
  static const double _iconPadding = 10;

  const DetailsItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: _iconSize,
        height: _iconSize,
        padding: EdgeInsets.all(_iconPadding),
        decoration: BoxDecoration(
          color: AppColors.irisBlue,
          borderRadius: BorderRadius.circular(_iconSize),
        ),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            AppColors.whiteSmoke,
            BlendMode.srcIn,
          ),
        ),
      ),
      title: Text(
        label,
        style: FontStyles.bodyMedium.copyWith(
          color: AppColors.grey,
        ),
      ),
      subtitle: Text(
        value,
        style: FontStyles.subtitleBold,
      ),
    );
  }
}
