import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatefulWidget {
  GlassContainer({
    Key key,
    this.glassborder = 0.0,
    this.glassheight,
    this.glasswidth,
    this.glasswidget,
  }) : super(key: key);

  final double glassheight;
  final double glasswidth;
  final double glassborder;
  final Widget glasswidget;

  @override
  _GlassContainerState createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 24,
            spreadRadius: 16,
            color: Colors.black.withOpacity(0.2))
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.glassborder),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 26.0, sigmaY: 26.0),
          child: Container(
              height: widget.glassheight,
              width: widget.glasswidth,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(widget.glassborder),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: widget.glasswidget),
        ),
      ),
    );
  }
}
