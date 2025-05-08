/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/agua.png
  AssetGenImage get agua => const AssetGenImage('assets/img/agua.png');

  /// File path: assets/img/agua_gas.png
  AssetGenImage get aguaGas => const AssetGenImage('assets/img/agua_gas.png');

  /// File path: assets/img/agua_saborizada.png
  AssetGenImage get aguaSaborizada =>
      const AssetGenImage('assets/img/agua_saborizada.png');

  /// File path: assets/img/bolo_banana.png
  AssetGenImage get boloBanana =>
      const AssetGenImage('assets/img/bolo_banana.png');

  /// File path: assets/img/bolo_castanha.png
  AssetGenImage get boloCastanha =>
      const AssetGenImage('assets/img/bolo_castanha.png');

  /// File path: assets/img/bolo_cenoura.png
  AssetGenImage get boloCenoura =>
      const AssetGenImage('assets/img/bolo_cenoura.png');

  /// File path: assets/img/bolo_chocolate.png
  AssetGenImage get boloChocolate =>
      const AssetGenImage('assets/img/bolo_chocolate.png');

  /// File path: assets/img/bolo_floresta_negra.png
  AssetGenImage get boloFlorestaNegra =>
      const AssetGenImage('assets/img/bolo_floresta_negra.png');

  /// File path: assets/img/brownie.png
  AssetGenImage get brownie => const AssetGenImage('assets/img/brownie.png');

  /// File path: assets/img/donnut_chocolate.png
  AssetGenImage get donnutChocolate =>
      const AssetGenImage('assets/img/donnut_chocolate.png');

  /// File path: assets/img/dunnut.png
  AssetGenImage get dunnut => const AssetGenImage('assets/img/dunnut.png');

  /// File path: assets/img/dunnut_banana.png
  AssetGenImage get dunnutBanana =>
      const AssetGenImage('assets/img/dunnut_banana.png');

  /// File path: assets/img/dunnut_chocolate_amargo.png
  AssetGenImage get dunnutChocolateAmargo =>
      const AssetGenImage('assets/img/dunnut_chocolate_amargo.png');

  /// File path: assets/img/dunnut_morango.png
  AssetGenImage get dunnutMorango =>
      const AssetGenImage('assets/img/dunnut_morango.png');

  /// File path: assets/img/dunnut_morango_nutella.png
  AssetGenImage get dunnutMorangoNutella =>
      const AssetGenImage('assets/img/dunnut_morango_nutella.png');

  /// File path: assets/img/dunnut_nevado.png
  AssetGenImage get dunnutNevado =>
      const AssetGenImage('assets/img/dunnut_nevado.png');

  /// File path: assets/img/dunnut_pistache.png
  AssetGenImage get dunnutPistache =>
      const AssetGenImage('assets/img/dunnut_pistache.png');

  /// File path: assets/img/refrigerante_cola.png
  AssetGenImage get refrigeranteCola =>
      const AssetGenImage('assets/img/refrigerante_cola.png');

  /// File path: assets/img/refrigerante_cola_zero.png
  AssetGenImage get refrigeranteColaZero =>
      const AssetGenImage('assets/img/refrigerante_cola_zero.png');

  /// File path: assets/img/schweeppes.png
  AssetGenImage get schweeppes =>
      const AssetGenImage('assets/img/schweeppes.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    agua,
    aguaGas,
    aguaSaborizada,
    boloBanana,
    boloCastanha,
    boloCenoura,
    boloChocolate,
    boloFlorestaNegra,
    brownie,
    donnutChocolate,
    dunnut,
    dunnutBanana,
    dunnutChocolateAmargo,
    dunnutMorango,
    dunnutMorangoNutella,
    dunnutNevado,
    dunnutPistache,
    refrigeranteCola,
    refrigeranteColaZero,
    schweeppes,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
