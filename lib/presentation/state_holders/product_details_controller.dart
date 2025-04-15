import 'package:medical_app/data/models/network_response.dart';
import 'package:medical_app/data/models/product_details_data.dart';
import 'package:medical_app/data/models/product_details_model.dart';
import 'package:medical_app/data/services/network_caller.dart';
import 'package:medical_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  ProductDetailsModel productDetailsModel = ProductDetailsModel();

  ProductDetailsDataModel get productDetailsData =>
      productDetailsModel.data!.first;

  Future<bool> getProductDetails(int productId) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.productDetails(productId));
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      productDetailsModel =
          ProductDetailsModel.fromJson(networkResponse.responseData);
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
