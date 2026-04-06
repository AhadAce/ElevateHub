import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

import 'file_state.dart';

class FileCubit extends Cubit<FileState> {
  FileCubit() : super(FileInitState());

  static FileCubit get(context) => BlocProvider.of(context);

  static File? file;
  static File? file2;
  static String? fileName;
  static String? fileSize;
  // var picker = FilePicker();
  void removeFile() {
    file = null;
    fileName = null;
    fileSize = null;
    emit(FileRemoveFileState());
  }

  Future<void> getFile() async {
    FilePickerResult? pickerFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: [
        'pdf',
        'png',
        'jpeg',
        'jpg',
        'PDF',
        'PNG',
        'JPEG',
        'JPG',
      ],
    );

    if (pickerFile != null) {
      double size = (pickerFile.files.first.size / 1000);
      if (size > 1000) {
        size = size / 1000;
        fileSize = '${size.toStringAsFixed(2)} MB';
      } else {
        fileSize = '${size.toStringAsFixed(2)} KB';
      }
      fileName = pickerFile.files.first.name;
      file = File(pickerFile.files.first.path ?? '');
      emit(FileChangeState());
    } else {
      print('No File Selected');
      emit(FileChangeFilerState());
    }
  }

  Future<void> getFile2() async {
    FilePickerResult? pickerFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: [
        'pdf',
        'png',
        'jpeg',
        'jpg',
        'PDF',
        'PNG',
        'JPEG',
        'JPG',
      ],
    );

    if (pickerFile != null) {
      double size = (pickerFile.files.first.size / 1000);
      if (size > 1000) {
        size = size / 1000;
        fileSize = '${size.toStringAsFixed(2)} MB';
      } else {
        fileSize = '${size.toStringAsFixed(2)} KB';
      }
      fileName = pickerFile.files.first.name;
      file2 = File(pickerFile.files.first.path ?? '');
      emit(FileChange2State());
    } else {
      print('No File Selected');
      emit(FileChangeFilerState());
    }
  }
}
