import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<PermissionStatus> requestPermission(Permission permission) async {
    return await permission.request();
  }

  Future<bool> shouldShowRequestRationale(Permission permission) async {
    // This is only implemented on Android, calling this on iOS always returns false
    return await permission.shouldShowRequestRationale;
  }

  Future<Map<Permission, PermissionStatus>> requestMultiplePermission(
      List<Permission> permissionList) async {
    Map<Permission, PermissionStatus> permissionStatus =
        await permissionList.request();

    return permissionStatus;
  }

  Future<bool> openAppSetting() async {
    var result = openAppSettings();
    return await result;
  }

  Future<void> relationalDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Container(
            padding: const EdgeInsets.all(10.0),
            color: Colors.redAccent,
            child: const Icon(
              Icons.add,
              size: 20.0,
            ),
          ),
          title: const Text(" Permission Required"),
          content: const Text(
              "We need access to your  to provide better services. Please grant the permission."),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Grant Permission"),
              onPressed: () async {
                Navigator.of(context).pop();
                // await permission.request();
              },
            ),
          ],
        );
      },
    );
  }
}
