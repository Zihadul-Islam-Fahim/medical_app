import 'package:flutter/cupertino.dart';
import 'package:medical_app/data/models/network_response.dart';
import 'package:medical_app/data/models/wishlist_product_model.dart';
import 'package:medical_app/data/services/network_caller.dart';
import 'package:medical_app/data/utilities/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medical_app/presentation/ui/utility/utils.dart';

class WishlistController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  WishlistProductModel _wishlistProductModel = WishlistProductModel();

  WishlistProductModel get wishlistProductModel => _wishlistProductModel;

  Future<bool> addToWishList(int productId,BuildContext context) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.addToWishList(productId));
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      customToast(context, "Added to wishlist");
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      customToast(context, "Failed to add in wishlist",isError: true);
      return false;
    }
  }

  Future<bool> getWishList() async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.wishList);
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      _wishlistProductModel =
          WishlistProductModel.fromJson(networkResponse.responseData);
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }

  Future<bool> deleteFromWishList(int productId) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.removeWishList(productId));
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      getWishList();
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
