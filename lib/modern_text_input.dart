library modern_text_input;

import 'package:flutter/material.dart';
import 'package:modern_text_input/custom_animated_icon.dart';

class ModernTextInput extends StatefulWidget {
  const ModernTextInput({
    super.key,
    required this.controller,
    required this.style,
    required this.hintText,
    required this.primaryColor,
    required this.secondaryColor,
    required this.icon,
    this.isFilled = false,
    //
    this.showSuffixIcon = false,
    this.isPassword = false,
    this.enabledSuffixIcon,
    this.disabledSuffixIcon,
    this.onSuffixIconPressed,
    //
    this.isNumber = false,
  });

  final TextEditingController controller;
  final TextStyle style;
  final String hintText;
  final Color primaryColor;
  final Color secondaryColor;
  final IconData icon;
  final bool isFilled;

  final bool showSuffixIcon;
  final bool isPassword;
  final IconData? enabledSuffixIcon;
  final IconData? disabledSuffixIcon;
  final VoidCallback? onSuffixIconPressed;

  final bool isNumber;

  @override
  State<ModernTextInput> createState() => _ModernTextInputState();
}

class _ModernTextInputState extends State<ModernTextInput> {
  @override
  Widget build(BuildContext context) {
    if (widget.showSuffixIcon == false) {
      return TextField(
        style: widget.style,
        cursorColor: widget.primaryColor,
        controller: widget.controller,
        keyboardType: widget.isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.style.copyWith(color: widget.primaryColor.withOpacity(0.6)),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          filled: widget.isFilled,
          fillColor: widget.secondaryColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.primaryColor.withOpacity(0.1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.primaryColor.withOpacity(0.6),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: widget.primaryColor.withOpacity(0.1)),
              ),
            ),
            margin: const EdgeInsets.only(right: 16),
            child: Icon(
              widget.icon,
              color: widget.primaryColor.withOpacity(0.8),
              size: 16,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 80),
        ),
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      );
    } else {
      return Stack(
        children: [
          TextField(
            style: widget.style,
            cursorColor: widget.primaryColor,
            controller: widget.controller,
            obscureText: widget.isPassword,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.style.copyWith(color: widget.primaryColor.withOpacity(0.6)),
              contentPadding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
              filled: widget.isFilled,
              fillColor: widget.secondaryColor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.primaryColor.withOpacity(0.1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.primaryColor.withOpacity(0.8),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: widget.primaryColor.withOpacity(0.1)),
                  ),
                ),
                margin: const EdgeInsets.only(right: 16),
                child: Icon(
                  widget.icon,
                  color: widget.primaryColor.withOpacity(0.8),
                  size: 16,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(minWidth: 80),
              suffix: const SizedBox(width: 50),
            ),
            onTapOutside: (PointerDownEvent event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
          Positioned(
            right: 12,
            top: 8,
            child: CustomAnimatedIcon(
              beginIcon: widget.enabledSuffixIcon ?? Icons.visibility_off,
              endIcon: widget.disabledSuffixIcon ?? Icons.visibility,
              size: 20,
              curve: Curves.easeInOut,
              color: widget.primaryColor.withOpacity(0.8),
              onPressed: widget.onSuffixIconPressed,
            ),
          ),
        ],
      );
    }
  }
}
