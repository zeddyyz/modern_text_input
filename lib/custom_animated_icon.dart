import 'package:flutter/material.dart';
import 'package:icons_animate/icons_animate.dart';

class CustomAnimatedIcon extends StatefulWidget {
  const CustomAnimatedIcon({
    super.key,
    required this.beginIcon,
    required this.endIcon,
    this.curve,
    this.size,
    this.color,
    this.onPressed,
  });

  final IconData beginIcon;
  final IconData endIcon;
  final Curve? curve;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  State<CustomAnimatedIcon> createState() => _CustomAnimatedIconState();
}

class _CustomAnimatedIconState extends State<CustomAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimateIconController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimateIconController();
  }

  bool onEndIconPress(BuildContext context) {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
    return true;
  }

  bool onStartIconPress(BuildContext context) {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimateIcons(
      startIcon: widget.beginIcon,
      endIcon: widget.endIcon,
      controller: _controller,
      startIconColor: widget.color ?? Theme.of(context).iconTheme.color,
      endIconColor: widget.color ?? Theme.of(context).iconTheme.color,
      size: widget.size ?? 24.0,
      curve: widget.curve ?? Curves.linear,
      duration: const Duration(milliseconds: 650),
      onEndIconPress: () => onEndIconPress(context),
      onStartIconPress: () => onStartIconPress(context),
    );
  }
}
