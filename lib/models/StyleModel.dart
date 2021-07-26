import 'dart:convert';

import '../constants/importConstants.dart';

class StyleModel {

  final String fontStyle;
  final int borderRadius;
  final Color color;
  final FontWeight fontWeight;
  final double opacity;
  final double height;
  final double width;
  final double padding;
  
  StyleModel({
    required this.fontStyle,
    required this.borderRadius,
    required this.color,
    required this.fontWeight,
    required this.opacity,
    required this.height,
    required this.width,
    required this.padding,
  });
  

  StyleModel copyWith({
    String? fontStyle,
    int? borderRadius,
    Color? color,
    FontWeight? fontWeight,
    double? opacity,
    double? height,
    double? width,
    double? padding,
  }) {
    return StyleModel(
      fontStyle: fontStyle ?? this.fontStyle,
      borderRadius: borderRadius ?? this.borderRadius,
      color: color ?? this.color,
      fontWeight: fontWeight ?? this.fontWeight,
      opacity: opacity ?? this.opacity,
      height: height ?? this.height,
      width: width ?? this.width,
      padding: padding ?? this.padding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fontStyle': fontStyle,
      'borderRadius': borderRadius,
      'color': color.value,
      'fontWeight': fontWeight.toMap(),
      'opacity': opacity,
      'height': height,
      'width': width,
      'padding': padding,
    };
  }

  factory StyleModel.fromMap(Map<String, dynamic> map) {
    return StyleModel(
      fontStyle: map['fontStyle'],
      borderRadius: map['borderRadius'],
      color: Color(map['color']),
      fontWeight: FontWeight.fromMap(map['fontWeight']),
      opacity: map['opacity'],
      height: map['height'],
      width: map['width'],
      padding: map['padding'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StyleModel.fromJson(String source) => StyleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StyleModel(fontStyle: $fontStyle, borderRadius: $borderRadius, color: $color, fontWeight: $fontWeight, opacity: $opacity, height: $height, width: $width, padding: $padding)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StyleModel &&
      other.fontStyle == fontStyle &&
      other.borderRadius == borderRadius &&
      other.color == color &&
      other.fontWeight == fontWeight &&
      other.opacity == opacity &&
      other.height == height &&
      other.width == width &&
      other.padding == padding;
  }

  @override
  int get hashCode {
    return fontStyle.hashCode ^
      borderRadius.hashCode ^
      color.hashCode ^
      fontWeight.hashCode ^
      opacity.hashCode ^
      height.hashCode ^
      width.hashCode ^
      padding.hashCode;
  }
}
