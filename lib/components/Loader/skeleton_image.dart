import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// TODO:: add shimmer dependency in pubspec.yaml file compatible version : [shimmer: ^3.0.0]

Widget displaySkeletonImage({
  required String imagePath,
  required String errorImagePath,
  double imageHeight = 150.0,
  double imageWidth = double.infinity,
  BoxFit boxFit = BoxFit.fill,
  BoxFit errorImgBoxFit = BoxFit.fill,
  double borderRadius = 12.0,
  Color backgroundColor = Colors.grey,
  ShimmerDirection shimmerDirection = ShimmerDirection.ltr,
  Color shimmerBaseColor = Colors.grey,
  Color shimmerHighlightedColor = Colors.grey,
}) {
  return Image.network(
    imagePath,
    width: imageWidth,
    height: imageHeight,
    fit: boxFit,
    frameBuilder: (BuildContext context, Widget child, int? frame,
        bool wasSynchronouslyLoaded) {
      if (frame == null) {
        return SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              decoration: BoxDecoration(color: backgroundColor),
            ),
          ),
        );
      }
      return child;
    },
    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
      return Container(
        width: imageWidth,
        height: imageHeight,
        padding: const EdgeInsets.all(30.0),
        child: Image.asset(
          fit: errorImgBoxFit,
          errorImagePath,
          // fit: BoxFit.fill,
        ),
      );
    },
    loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) return child;
      return SizedBox(
        width: imageWidth,
        height: imageHeight,
        child: Shimmer.fromColors(
          baseColor: shimmerBaseColor,
          highlightColor: shimmerHighlightedColor,
          direction: shimmerDirection,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      );
    },
  );
}
