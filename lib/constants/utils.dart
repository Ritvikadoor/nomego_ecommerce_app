// import 'dart:io';

// import 'dart:developer';

// import 'package:cloudinary_public/cloudinary_public.dart';
import 'dart:developer';
import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:nomego_ecommerce_app/providers/users_providers.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

// pickImages() async {
//   final cloudinary = Cloudinary.signedConfig(
//     apiKey: "621355784394787",
//     apiSecret: "t4Gz17EYvN5eGvy86y6-QHeHJ0w",
//     cloudName: "dky63hvjq",
//   );
//   ImagePicker picker = ImagePicker();

//   var image = await picker.pickImage(source: ImageSource.gallery);
//   if (image != null) {
//     log(image.path.toString());
//     final file = File(image.path).readAsBytesSync();

//     final response = await cloudinary.upload(
//         file: image.path,
//         fileBytes: file,
//         resourceType: CloudinaryResourceType.image,
//         folder: "nomogo",
//         fileName: image.name,
//         progressCallback: (count, total) {
//           print('Uploading image from file with progress: $count/$total');
//         });

//     if (response.isSuccessful) {
//       List<String?> imageUrls = [];

//       imageUrls.add(response.secureUrl);

//       print('Get your image from with ${response.secureUrl}');
//     }
//   } else {
//     return;
//   }

//   // final cloudinary = CloudinaryPublic('dky63hvjq', 'nomogo');
//   // List<String> imageUrls = [];
//   // CloudinaryResponse response = await cloudinary.uploadFile(
//   //   CloudinaryFile.fromFile(image.path,
//   //       resourceType: CloudinaryResourceType.Image),
//   // );

//   // log(response.toString());
// }

// Future<List<File>> pickImages() async {
//   List<File> images = [];
//   try {
//     var files = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       allowMultiple: true,
//     );
//     if (files != null && files.files.isNotEmpty) {
//       for (int i = 0; i < files.files.length; i++) {
//         images.add(File(files.files[i].path!));
//       }
//     }
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return images;
// }
