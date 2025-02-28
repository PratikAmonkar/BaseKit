import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

//Todo: Add provider file in res/xml/flutter_downloader_provider_paths.xml

class FileDownloadService {
  static Future<void> initialize() async {
    await FlutterDownloader.initialize(
      debug: false,
    );
  }

  static Future<String?> downloadFile({
    required String url,
    required String fileName,
    required String savePath,
    bool isImage = false,
  }) async {
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: savePath,
      fileName: fileName,
      showNotification: true,
      openFileFromNotification: true,
    );
    if (isImage) {
      Timer.periodic(
        const Duration(seconds: 10),
        (timer) async {
          if (taskId != null) {
            bool completed = await checkDownloadStatus(
                taskId: taskId, path: "$savePath/$fileName");
            if (completed) {
              timer.cancel();
            }
          }
        },
      );
    }
    return taskId;
  }

  static Future<bool> checkDownloadStatus(
      {required String taskId, required String path}) async {
    const channel =
        MethodChannel("com.pratik.flutter_core_concept/media_scanner");
    final task = await FlutterDownloader.loadTasksWithRawQuery(
        query: 'SELECT * FROM task WHERE task_id="$taskId"');
    if (task?.isNotEmpty == true) {
      final status = task?.first.status;
      if (status == DownloadTaskStatus.complete) {
        await channel.invokeMethod(
          'refreshGallery',
          {"path": path},
        );
        return true;
      }
      /*else if (status == DownloadTaskStatus.failed) {
        debugPrint("Download failed");
      }
      else if (status == DownloadTaskStatus.canceled) {
        debugPrint("Download canceled");
      }*/
    }
    return false;
  }

  static Future<void> cancelDownload(String taskId) async {
    await FlutterDownloader.cancel(taskId: taskId);
  }

  static Future<void> deleteDownloadedFile(String taskId) async {
    await FlutterDownloader.remove(taskId: taskId, shouldDeleteContent: true);
  }

  static void listenToDownloadProgress(
      Function(DownloadTaskStatus status, int progress) callback) {
    FlutterDownloader.registerCallback(
      (id, status, progress) {
        callback(DownloadTaskStatus.fromInt(status), progress);
      },
    );
  }
}
