import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<File> copyAssetTofile(String assetFile) async {
  final tempDir = await getTemporaryDirectory();
  final filename = assetFile.split('/').last;
  final file = File('${tempDir.path}/$filename');

  final data = await rootBundle.load(assetFile);
  await file.writeAsBytes(
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    flush: true,
  );
  return file;
}
