import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  static StorageController instance = Get.find();
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> downloadUrl(String imageName) async {
    try {
      String downloadUrl =
          await storage.ref('products/$imageName').getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('downloadUrl error');
      print(
        e.toString(),
      );
      return '';
    }
  }
}
