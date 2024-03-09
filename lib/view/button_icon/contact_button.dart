import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactIconButton extends ConsumerWidget {
  const ContactIconButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse('https://forms.gle/zeFBMygChGeuL8Fc7');
        await launchUrl(uri);
      },
      child: Container(
        width: 80,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LineIcons.exclamationTriangle,
              size: 25,
              color: Colors.black54,
            ),
            Text(
              '誤りを報告',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
