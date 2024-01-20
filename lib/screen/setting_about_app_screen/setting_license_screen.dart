import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingLicenseScreen extends ConsumerWidget {
  const SettingLicenseScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LicensePage(
            applicationName: snapshot.data!.appName,
            applicationVersion: snapshot.data!.version,
            applicationLegalese: '${DateTime.now().year} Taiki Takemura',
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
