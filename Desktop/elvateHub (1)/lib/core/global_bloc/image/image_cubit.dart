import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitState());

  static ImageCubit get(context) => BlocProvider.of(context);

  static File? imageProfile;
  var picker = ImagePicker();
  static List<File> imageFiles = []; // List to store multiple images
  Future<void> getImages() async {
    final pickedFiles = await picker.pickMultiImage(); // Pick multiple images
    if (pickedFiles.isNotEmpty) {
      imageFiles = pickedFiles.map((file) => File(file.path)).toList();
      emit(ImageChangeState());
    } else {
      print('No Images Selected');
      emit(ImageChangeFileState());
    }
  }

  // To clear selected images
  void clearImages() {
    imageFiles.clear();
    emit(ImageInitState());
  }

  Future<void> getImage() async {
    final pickerFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerFile != null) {
      imageProfile = File(pickerFile.path);
      emit(ImageChangeState());
    } else {
      print('No Image Selected');
      emit(ImageChangeFileState());
    }
  }
}
