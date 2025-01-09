import 'package:image_picker/image_picker.dart';

class AssetPicker {
  Future<XFile?> pickImage({
    required ImageSource source,
  }) {
    return ImagePicker().pickImage(source: source);
  }
}
