/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsLanguagesGen {
  const $AssetsLanguagesGen();

  /// File path: assets/languages/en-US.json
  String get enUS => 'assets/languages/en-US.json';

  /// File path: assets/languages/ml.json
  String get ml => 'assets/languages/ml.json';
}

class Assets {
  Assets._();

  static const AssetGenImage con1 = AssetGenImage('assets/Con1.png');
  static const AssetGenImage maskGroup5 =
      AssetGenImage('assets/Mask Group 5.png');
  static const AssetGenImage scratchBg = AssetGenImage('assets/ScratchBg.png');
  static const AssetGenImage banner4 = AssetGenImage('assets/banner4.jpeg');
  static const AssetGenImage cele = AssetGenImage('assets/cele.png');
  static const AssetGenImage colorfulRemovebgPreview =
      AssetGenImage('assets/colorful-removebg-preview.png');
  static const AssetGenImage colorful = AssetGenImage('assets/colorful.png');
  static const AssetGenImage con2 = AssetGenImage('assets/con2.jpeg');
  static const AssetGenImage confettibackground =
      AssetGenImage('assets/confettibackground.png');
  static const AssetGenImage f1Jpeg = AssetGenImage('assets/f1.jpeg');
  static const AssetGenImage f1Png = AssetGenImage('assets/f1.png');
  static const AssetGenImage freimg = AssetGenImage('assets/freimg.jpeg');
  static const AssetGenImage giftJpeg = AssetGenImage('assets/gift.jpeg');
  static const AssetGenImage giftPng = AssetGenImage('assets/gift.png');
  static const AssetGenImage imagesNew =
      AssetGenImage('assets/images new.jpeg');
  static const AssetGenImage images = AssetGenImage('assets/images.jpeg');
  static const AssetGenImage kalayanSilksAdiSale =
      AssetGenImage('assets/kalayan-silks-adi-sale.jpg');
  static const AssetGenImage kalyanHypermarket =
      AssetGenImage('assets/kalyan-hypermarket.png');
  static const AssetGenImage kalyan = AssetGenImage('assets/kalyan.jpg');
  static const $AssetsLanguagesGen languages = $AssetsLanguagesGen();
  static const String loading = 'assets/loading.json';
  static const AssetGenImage logo = AssetGenImage('assets/logo.png');
  static const AssetGenImage panorama = AssetGenImage('assets/panorama.jpg');
  static const AssetGenImage panorama2 = AssetGenImage('assets/panorama2.webp');
  static const AssetGenImage panoramaCropped =
      AssetGenImage('assets/panorama_cropped.jpeg');
  static const AssetGenImage rupee = AssetGenImage('assets/rupee.jpeg');
  static const AssetGenImage scratchandwin =
      AssetGenImage('assets/scratchandwin.jpeg');
  static const String svgold = 'assets/svgold.svg';
  static const String svgviewerOutput = 'assets/svgviewer-output .svg';
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

  String get path => _assetName;

  String get keyName => _assetName;
}
