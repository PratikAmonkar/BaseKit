import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// TODO:: add permission_handler,path_provider,path,flutter_downloader and crypto dependency in pubspec.yaml file

class DownloadAnyFileService {
  void initializeDownloader() async {
    await FlutterDownloader.initialize(debug: true, ignoreSsl: false);
  }

  void downloadFile() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String downloadDir = "$appDocPath/test";

      Directory(downloadDir).createSync(recursive: true);

      final taskId = await FlutterDownloader.enqueue(
          url:
              'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          savedDir: downloadDir,
          fileName: 'demo1.jpg',
          showNotification: true,
          openFileFromNotification: true,
          saveInPublicStorage: true);
      debugPrint("taskId = $taskId");
    } on Exception catch (e) {
      debugPrint("Catch e = $e");
    }
  }

  Future<bool> checkAndRequestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  Future<String> getFilePath(String filename) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return join(appDocPath, filename);
  }

  void initDownloader() async {
    final taskId = await FlutterDownloader.enqueue(
      url: 'https://example.com/file.zip',
      savedDir: 'path_to_directory',
      fileName: 'desired_filename.zip',
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  Future<void> saveFileLocally(String filename, List<int> bytes) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, filename);
    File file = File(path);
    await file.writeAsBytes(bytes);
    debugPrint("File saved at $path");
  }

  Future<void> attemptSaveFile(String filename, List<int> bytes) async {
    bool hasPermission = await checkAndRequestStoragePermission();
    if (hasPermission) {
      try {
        await saveFileLocally(filename, bytes);
        debugPrint("File download and save completed.");
      } catch (e) {
        debugPrint("An error occurred while saving the file: $e");
      }
    } else {
      debugPrint("Storage permission not granted. Cannot save the file.");
    }
  }

  Future<bool> verifyDownloadedFile(
      String filePath, String originalChecksum) async {
    File file = File(filePath);
    List<int> fileBytes = await file.readAsBytes();
    String fileChecksum = md5.convert(fileBytes).toString();

    return fileChecksum == originalChecksum;
  }

  void updateDownloadProgress(double progress, BuildContext context) {}

  void showDownloadCompleteNotification(String filename, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$filename downloaded successfully."),
      ),
    );
  }
}
