import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

///Clearボタン
class ClearButton extends ConsumerWidget {
  const ClearButton({required this.iconSize, required this.onPressed});

  final double iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: iconSize,
      width: iconSize,
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          iconSize: iconSize,
          onPressed: () {
            onPressed();
            Navigator.of(context).pop();
            HapticFeedback.lightImpact();
          },
          icon: Icon(
            LineIcons.times,
            color: Colors.black54,
            size: iconSize - 5,
          ),
        ),
      ),
    );
  }
}
