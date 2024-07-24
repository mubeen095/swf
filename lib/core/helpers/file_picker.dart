import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<dynamic> filePickerHelper(
    {bool allowMultiple = false, List<String>? allowedExtensions}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: allowMultiple,
    allowedExtensions: allowedExtensions,
  );

  if (result != null) {
    if (allowMultiple) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      return files;
    } else {
      File file = File(result.files.single.path!);
      return file;
    }
  } else {
    return null;
  }
}
