/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/alien.svg
  SvgGenImage get alien => const SvgGenImage('assets/images/alien.svg');

  /// File path: assets/images/alive.svg
  SvgGenImage get alive => const SvgGenImage('assets/images/alive.svg');

  /// File path: assets/images/arrow-left.svg
  SvgGenImage get arrowLeft =>
      const SvgGenImage('assets/images/arrow-left.svg');

  /// File path: assets/images/dead.svg
  SvgGenImage get dead => const SvgGenImage('assets/images/dead.svg');

  /// File path: assets/images/female.svg
  SvgGenImage get female => const SvgGenImage('assets/images/female.svg');

  /// File path: assets/images/gender_unknown.svg
  SvgGenImage get genderUnknown =>
      const SvgGenImage('assets/images/gender_unknown.svg');

  /// File path: assets/images/human.svg
  SvgGenImage get human => const SvgGenImage('assets/images/human.svg');

  /// File path: assets/images/information.svg
  SvgGenImage get information =>
      const SvgGenImage('assets/images/information.svg');

  /// File path: assets/images/liked.svg
  SvgGenImage get liked => const SvgGenImage('assets/images/liked.svg');

  /// File path: assets/images/male.svg
  SvgGenImage get male => const SvgGenImage('assets/images/male.svg');

  /// File path: assets/images/unknown.svg
  SvgGenImage get unknown => const SvgGenImage('assets/images/unknown.svg');

  /// File path: assets/images/unliked.svg
  SvgGenImage get unliked => const SvgGenImage('assets/images/unliked.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        alien,
        alive,
        arrowLeft,
        dead,
        female,
        genderUnknown,
        human,
        information,
        liked,
        male,
        unknown,
        unliked
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
