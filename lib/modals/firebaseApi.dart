import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final database = FirebaseStorage.instance.ref(destination);
      return database.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

//
  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final database = FirebaseStorage.instance.ref(destination);
      return database.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }

// code for download files..

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  /*static void downloadFile(Reference ref) async {
    final dir = await getApplicationDocumentsDirectory();

    String downloadURL = await ref.getDownloadURL();
    print("downloadURL = ");
    print(downloadURL);

  }*/
}

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile(
      {required this.ref, required this.name, required this.url});
}
