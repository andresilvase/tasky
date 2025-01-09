import 'package:image_picker/image_picker.dart';

class AssetPicker {
  final ImagePicker _imagePicker;

  AssetPicker([ImagePicker? imagePicker]) : _imagePicker = imagePicker ?? ImagePicker();

  Future<XFile?> pickImage({
    required ImageSource source,
  }) {
    return _imagePicker.pickImage(source: source);
  }
}
