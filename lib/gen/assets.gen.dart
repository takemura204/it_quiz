/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/Google_icon.png
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/icon/Google_icon.png');

  /// File path: assets/icon/Line_icon.png
  AssetGenImage get lineIcon =>
      const AssetGenImage('assets/icon/Line_icon.png');

  /// File path: assets/icon/Twitter_icon.png
  AssetGenImage get twitterIcon =>
      const AssetGenImage('assets/icon/Twitter_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [googleIcon, lineIcon, twitterIcon];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/cat_grey.png
  AssetGenImage get catGrey => const AssetGenImage('assets/image/cat_grey.png');

  /// File path: assets/image/cat_sample1.png
  AssetGenImage get catSample1 =>
      const AssetGenImage('assets/image/cat_sample1.png');

  /// File path: assets/image/cat_white.png
  AssetGenImage get catWhite =>
      const AssetGenImage('assets/image/cat_white.png');

  /// File path: assets/image/sample_01.jpg
  AssetGenImage get sample01 =>
      const AssetGenImage('assets/image/sample_01.jpg');

  /// File path: assets/image/sample_02.jpg
  AssetGenImage get sample02 =>
      const AssetGenImage('assets/image/sample_02.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [catGrey, catSample1, catWhite, sample01, sample02];
}

class Assets {
  Assets._();

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
