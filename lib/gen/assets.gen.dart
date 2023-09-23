/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/JetBrainsMono-Bold.ttf
  String get jetBrainsMonoBold => 'assets/fonts/JetBrainsMono-Bold.ttf';

  /// File path: assets/fonts/JetBrainsMono-ExtraBold.ttf
  String get jetBrainsMonoExtraBold =>
      'assets/fonts/JetBrainsMono-ExtraBold.ttf';

  /// File path: assets/fonts/JetBrainsMono-ExtraLight.ttf
  String get jetBrainsMonoExtraLight =>
      'assets/fonts/JetBrainsMono-ExtraLight.ttf';

  /// File path: assets/fonts/JetBrainsMono-Italic.ttf
  String get jetBrainsMonoItalic => 'assets/fonts/JetBrainsMono-Italic.ttf';

  /// File path: assets/fonts/JetBrainsMono-Light.ttf
  String get jetBrainsMonoLight => 'assets/fonts/JetBrainsMono-Light.ttf';

  /// File path: assets/fonts/JetBrainsMono-Medium.ttf
  String get jetBrainsMonoMedium => 'assets/fonts/JetBrainsMono-Medium.ttf';

  /// File path: assets/fonts/JetBrainsMono-Regular.ttf
  String get jetBrainsMonoRegular => 'assets/fonts/JetBrainsMono-Regular.ttf';

  /// File path: assets/fonts/JetBrainsMono-SemiBold.ttf
  String get jetBrainsMonoSemiBold => 'assets/fonts/JetBrainsMono-SemiBold.ttf';

  /// File path: assets/fonts/JetBrainsMono-Thin.ttf
  String get jetBrainsMonoThin => 'assets/fonts/JetBrainsMono-Thin.ttf';

  /// File path: assets/fonts/NotoSansJP-Black.ttf
  String get notoSansJPBlack => 'assets/fonts/NotoSansJP-Black.ttf';

  /// File path: assets/fonts/NotoSansJP-Bold.ttf
  String get notoSansJPBold => 'assets/fonts/NotoSansJP-Bold.ttf';

  /// File path: assets/fonts/NotoSansJP-ExtraBold.ttf
  String get notoSansJPExtraBold => 'assets/fonts/NotoSansJP-ExtraBold.ttf';

  /// File path: assets/fonts/NotoSansJP-ExtraLight.ttf
  String get notoSansJPExtraLight => 'assets/fonts/NotoSansJP-ExtraLight.ttf';

  /// File path: assets/fonts/NotoSansJP-Light.ttf
  String get notoSansJPLight => 'assets/fonts/NotoSansJP-Light.ttf';

  /// File path: assets/fonts/NotoSansJP-Medium.ttf
  String get notoSansJPMedium => 'assets/fonts/NotoSansJP-Medium.ttf';

  /// File path: assets/fonts/NotoSansJP-Regular.ttf
  String get notoSansJPRegular => 'assets/fonts/NotoSansJP-Regular.ttf';

  /// File path: assets/fonts/NotoSansJP-SemiBold.ttf
  String get notoSansJPSemiBold => 'assets/fonts/NotoSansJP-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
        jetBrainsMonoBold,
        jetBrainsMonoExtraBold,
        jetBrainsMonoExtraLight,
        jetBrainsMonoItalic,
        jetBrainsMonoLight,
        jetBrainsMonoMedium,
        jetBrainsMonoRegular,
        jetBrainsMonoSemiBold,
        jetBrainsMonoThin,
        notoSansJPBlack,
        notoSansJPBold,
        notoSansJPExtraBold,
        notoSansJPExtraLight,
        notoSansJPLight,
        notoSansJPMedium,
        notoSansJPRegular,
        notoSansJPSemiBold
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
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
