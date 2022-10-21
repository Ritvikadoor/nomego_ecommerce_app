import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:nomego_ecommerce_app/modules/admin/model/sales.dart';
import 'package:nomego_ecommerce_app/constants/errorhandling.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/constants/utils.dart';
import 'package:nomego_ecommerce_app/modules/models/order.dart';
import 'package:nomego_ecommerce_app/modules/models/product.dart';
import 'package:nomego_ecommerce_app/providers/users_providers.dart';
import 'package:provider/provider.dart';

class AdminServices extends ChangeNotifier {
  List<String> imageUrls = [];
  List<Product> productList = [];

  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<String> images,
  }) async {
    // final ImagePicker _picker = ImagePicker();

    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    // var image = await _picker.pickImage(source: ImageSource.gallery);
    try {
      // final cloudinary = CloudinaryPublic('dky63hvjq', 'nomogo');
      // List<String> imageUrls = [];
      // CloudinaryResponse response = await cloudinary.uploadFile(
      //   CloudinaryFile.fromFile(image!.path,
      //       resourceType: CloudinaryResourceType.Image),
      // );
      // log(image.path.toString());
      // log(response.toString());
      log('Sell PRODUCT function Working');

      // pickImages();

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    notifyListeners();
  }

  // get all the products
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);

    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    log(productList.toString());

    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    notifyListeners();
  }

  Future<List<Order>> fetchAllOrders(BuildContext context) async {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-orders'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    notifyListeners();
    return orderList;
  }

  void changeOrderStatus({
    required BuildContext context,
    required int status,
    required Order order,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/change-order-status'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': order.id,
          'status': status,
        }),
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: onSuccess,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    notifyListeners();
  }

  Future<Map<String, dynamic>> getEarnings(BuildContext context) async {
    final userProvider = Provider.of<UsersProvider>(context, listen: false);
    List<Sales> sales = [];
    int totalEarning = 0;
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/analytics'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          totalEarning = response['totalEarnings'];
          sales = [
            Sales('Mobiles', response['mobileEarnings']),
            Sales('Essentials', response['essentialEarnings']),
            Sales('Books', response['booksEarnings']),
            Sales('Appliances', response['applianceEarnings']),
            Sales('Fashion', response['fashionEarnings']),
          ];
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    notifyListeners();
    return {
      'sales': sales,
      'totalEarnings': totalEarning,
    };
  }

  pickImages() async {
    final cloudinary = Cloudinary.signedConfig(
      apiKey: "621355784394787",
      apiSecret: "t4Gz17EYvN5eGvy86y6-QHeHJ0w",
      cloudName: "dky63hvjq",
    );
    ImagePicker picker = ImagePicker();

    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      log(image.path.toString());
      final file = File(image.path).readAsBytesSync();

      final response = await cloudinary.upload(
          file: image.path,
          fileBytes: file,
          resourceType: CloudinaryResourceType.image,
          folder: "nomogo",
          fileName: image.name,
          progressCallback: (count, total) {
            print('Uploading image from file with progress: $count/$total');
          });

      if (response.isSuccessful) {
        imageUrls.add(response.secureUrl!);

        print('Get your image from with $imageUrls');
      }
    }
    notifyListeners();
    return imageUrls;
  }

  updateListener(BuildContext context) {
    notifyListeners();
  }
}
