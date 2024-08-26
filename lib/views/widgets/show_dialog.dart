import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mentor_task/provider/auth_provider.dart';

void showImageSourceDialog(BuildContext context, AuthProvider authProvider) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Choose Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                authProvider.pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                authProvider.pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      );
    },
  );
}
