import 'package:package_info_plus/package_info_plus.dart';

class AppInfoUtil {
  static Future<Map<String, String>> getAppInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return {
      'appName': packageInfo.appName,
      'packageName': packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
      'buildSignature': packageInfo.buildSignature,
    };
  }

  static Future<String> getPackageName() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  static Future<String> getVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> getBuildNumber() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
}
