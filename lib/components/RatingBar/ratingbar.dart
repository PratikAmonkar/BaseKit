import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final int maxRating;
  final double initialRating;
  final void Function(RatingValue) onRatingUpdate;
  final Color filledColor;
  final Color unfilledColor;
  final double size;
  final IconData icon;
  final double? containerWidth;
  final bool allowPreciseRating;
  final RatingBehavior ratingBehavior;

  const RatingBar({
    super.key,
    required this.maxRating,
    required this.initialRating,
    required this.onRatingUpdate,
    this.filledColor = Colors.orange,
    this.unfilledColor = Colors.grey,
    this.size = 30,
    this.icon = Icons.star,
    this.containerWidth,
    this.allowPreciseRating = false,
    this.ratingBehavior = RatingBehavior.onTapOnly,
  });

  @override
  RatingBarState createState() => RatingBarState();
}

class RatingBarState extends State<RatingBar> {
  double _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.containerWidth,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.maxRating,
          (index) {
            return GestureDetector(
              // onTap: () => _updateRating(index + 1.0),
              onTap: () => {
                if (widget.ratingBehavior != RatingBehavior.onDragOnly)
                  {
                    _updateRating(
                      index +
                          (widget.ratingBehavior == RatingBehavior.onHalfOnly
                              ? 0.5
                              : 1.0),
                    ),
                  }
              },
              onHorizontalDragUpdate: (details) {
                if (widget.ratingBehavior == RatingBehavior.onDragOnly ||
                    widget.ratingBehavior == RatingBehavior.all) {
                  RenderBox renderBox = context.findRenderObject() as RenderBox;
                  var localPosition =
                      renderBox.globalToLocal(details.globalPosition);
                  var rating = (localPosition.dx / widget.size)
                      .clamp(0, widget.maxRating)
                      .toDouble();
                  _updateRating(rating);
                }
              },
              child: _buildStar(index),
            );
          },
        ),
      ),
    );
  }

  void _updateRating(double rating) {
    double newRating = 0.0;

    if (widget.ratingBehavior == RatingBehavior.onDragOnly ||
        widget.ratingBehavior == RatingBehavior.all) {
      newRating = rating;
    } else {
      newRating = _currentRating == rating
          ? widget.ratingBehavior == RatingBehavior.onHalfOnly
              ? _currentRating + 0.5
              : _currentRating - 1.0
          : rating;
    }

    setState(() {
      _currentRating = newRating;
    });

    double roundedRating = double.parse(_currentRating.toStringAsFixed(1));
    widget.onRatingUpdate(
      RatingValue(
        roundedValue: roundedRating,
        preciseValue: _currentRating,
      ),
    );
  }

  Widget _buildStar(int index) {
    double rating = _currentRating - index;
    rating = rating.clamp(0, 1);

    return Stack(
      children: [
        Icon(
          widget.icon,
          color: widget.unfilledColor,
          size: widget.size,
        ),
        ClipRect(
          clipper: _Clipper(rating: rating),
          child: Icon(
            widget.icon,
            color: widget.filledColor,
            size: widget.size,
          ),
        ),
      ],
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final double rating;

  _Clipper({required this.rating});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * rating, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return oldClipper != this;
  }
}

class RatingValue {
  final double roundedValue;
  final double preciseValue;

  RatingValue({
    required this.roundedValue,
    required this.preciseValue,
  });
}

enum RatingBehavior {
  onTapOnly,
  onDragOnly,
  onHalfOnly,
  all,
}

enum MainAxisAlignmentEnum {
  spaceBetween,
  evenly,
}
