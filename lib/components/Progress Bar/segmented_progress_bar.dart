import 'package:flutter/material.dart';

class SegmentedProgressBar extends StatelessWidget {
  final int segments;
  final double progress;
  final Color filledColor;
  final Color unfilledColor;
  final double segmentSpacing;
  final bool isPercentageValue;
  final double segmentBorderRadius;
  final double segmentHeight;
  final Function(int) onSegmentTap;

  const SegmentedProgressBar({
    super.key,
    required this.segments,
    required this.progress,
    this.filledColor = Colors.blue,
    this.unfilledColor = Colors.grey,
    this.segmentSpacing = 2.0,
    this.isPercentageValue = false,
    this.segmentBorderRadius = 10.0,
    this.segmentHeight = 10.0,
    this.onSegmentTap = _defaultOnSegmentTap,
  });

  static void _defaultOnSegmentTap(int index) {}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final segmentWidth =
            (constraints.maxWidth - (segmentSpacing * (segments - 1))) /
                segments;
        final filledSegments = isPercentageValue
            ? (segments * (progress / 100)).round()
            : progress;
        final List<Widget> segmentWidgets = [];

        for (int i = 0; i < segments; i++) {
          segmentWidgets.add(
            GestureDetector(
              onTap: () {
                onSegmentTap(i);
              },
              child: Container(
                width: segmentWidth,
                height: segmentHeight,
                decoration: BoxDecoration(
                  color: i < filledSegments ? filledColor : unfilledColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(i == 0 ? segmentBorderRadius : 0.0),
                    right: Radius.circular(
                      i == segments - 1 ? segmentBorderRadius : 0.0,
                    ),
                  ),
                ),
              ),
            ),
          );

          if (i < segments - 1) {
            segmentWidgets.add(SizedBox(width: segmentSpacing));
          }
        }

        return Row(
          children: segmentWidgets,
        );
      },
    );
  }
}
