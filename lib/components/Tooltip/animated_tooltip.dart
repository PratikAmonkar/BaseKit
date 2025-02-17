//animation
import 'dart:async';

import 'package:flutter/material.dart';

class TooltipArrowPainter extends CustomPainter {
  final Size size;
  final Color color;
  final bool isInverted;

  TooltipArrowPainter({
    required this.size,
    required this.color,
    required this.isInverted,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path();

    if (isInverted) {
      path
        ..moveTo(0.0, size.height)
        ..lineTo(size.width / 2, 0.0)
        ..lineTo(size.width, size.height);
    } else {
      path
        ..moveTo(0.0, 0.0)
        ..lineTo(size.width / 2, size.height)
        ..lineTo(size.width, 0.0);
    }

    path.close();
    canvas.drawShadow(path, Colors.black, 4.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TooltipArrow extends StatelessWidget {
  final Size size;
  final Color color;
  final bool isInverted;

  const TooltipArrow({
    super.key,
    this.size = const Size(16.0, 16.0),
    this.color = Colors.white,
    this.isInverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-size.width / 2, 0.0),
      child: CustomPaint(
        size: size,
        painter: TooltipArrowPainter(
          size: size,
          color: color,
          isInverted: isInverted,
        ),
      ),
    );
  }
}

class AnimatedTooltip extends StatefulWidget {
  final Widget content;
  final GlobalKey? targetGlobalKey;
  final Duration? delay;
  final Widget? child;

  const AnimatedTooltip({
    super.key,
    required this.content,
    this.targetGlobalKey,
    this.delay,
    this.child,
  }) : assert(child != null || targetGlobalKey != null);

  @override
  State<StatefulWidget> createState() => AnimatedTooltipState();
}

class AnimatedTooltipState extends State<AnimatedTooltip>
    with SingleTickerProviderStateMixin {
  double? tooltipTop;
  double? tooltipBottom;
  late Alignment tooltipAlignment;
  late Alignment transitionAlignment;
  late Alignment arrowAlignment;
  late bool isInverted;
  Timer? delayTimer;
  Size arrowSize = const Size(25.0, 50.0);
  double tooltipMinimumHeight = 140.0;
  int animationDuration = 300;
  Curve inCurve = Curves.easeIn;
  Curve outCurve = Curves.easeOut;

  final _overlayController = OverlayPortalController();
  late final AnimationController _animationController = AnimationController(
    duration: Duration(milliseconds: animationDuration),
    vsync: this,
  );

  late final Animation<double> _scaleAnimation = CurvedAnimation(
    parent: _animationController,
    curve: inCurve,
    reverseCurve: outCurve,
  );

  void _toggle() {
    delayTimer?.cancel();
    _animationController.stop();

    if (_overlayController.isShowing) {
      _animationController.reverse().then((_) => _overlayController.hide());
    } else {
      _updatePosition();
      _overlayController.show();
      _animationController.forward();
    }
  }

  void _updatePosition() {
    final contextSize = MediaQuery.of(context).size;
    final targetContext = widget.targetGlobalKey?.currentContext ?? context;
    final targetRenderBox = targetContext.findRenderObject() as RenderBox;
    final targetOffset = targetRenderBox.localToGlobal(Offset.zero);
    final targetSize = targetRenderBox.size;

    final tooltipFitsAboveTarget = targetOffset.dy - tooltipMinimumHeight >= 0;
    final tooltipFitsBelowTarget =
        targetOffset.dy + targetSize.height + tooltipMinimumHeight <=
            contextSize.height;

    tooltipTop = tooltipFitsAboveTarget
        ? null
        : tooltipFitsBelowTarget
            ? targetOffset.dy + targetSize.height
            : null;
    tooltipBottom = tooltipFitsAboveTarget
        ? contextSize.height - targetOffset.dy
        : tooltipFitsBelowTarget
            ? null
            : targetOffset.dy + targetSize.height / 2;

    isInverted = tooltipTop != null;

    tooltipAlignment = Alignment(
      (targetOffset.dx) / (contextSize.width - targetSize.width) * 2 - 1.0,
      isInverted ? 1.0 : -1.0,
    );

    transitionAlignment = Alignment(
      (targetOffset.dx + targetSize.width / 2) / contextSize.width * 2 - 1.0,
      isInverted ? -1.0 : 1.0,
    );

    arrowAlignment = Alignment(
      (targetOffset.dx + targetSize.width / 2) /
              (contextSize.width - arrowSize.width) *
              2 -
          1.0,
      isInverted ? 1.0 : -1.0,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.delay != null) {
        delayTimer = Timer(widget.delay!, _toggle);
      }
    });
  }

  @override
  void dispose() {
    delayTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal.targetsRootOverlay(
      controller: _overlayController,
      child: widget.child != null
          ? GestureDetector(onTap: _toggle, child: widget.child)
          : null,
      overlayChildBuilder: (context) {
        return Positioned(
          top: tooltipTop,
          bottom: tooltipBottom,
          child: ScaleTransition(
            alignment: transitionAlignment,
            scale: _scaleAnimation,
            child: TapRegion(
              onTapOutside: (PointerDownEvent event) => _toggle(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isInverted)
                      Align(
                        alignment: arrowAlignment,
                        child: TooltipArrow(
                          size: arrowSize,
                          isInverted: true,
                          color: Colors.deepPurple,
                        ),
                      ),
                    Align(
                      alignment: tooltipAlignment,
                      child: IntrinsicWidth(
                        child: Material(
                          elevation: 4.0,
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                widget.content,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (!isInverted)
                      Align(
                        alignment: arrowAlignment,
                        child: TooltipArrow(
                          size: arrowSize,
                          isInverted: false,
                          color: Colors.deepPurple,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
