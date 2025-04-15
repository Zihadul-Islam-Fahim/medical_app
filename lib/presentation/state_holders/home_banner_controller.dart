import 'package:medical_app/data/models/banner_list_model.dart';
import 'package:medical_app/data/models/network_response.dart';
import 'package:medical_app/data/services/network_caller.dart';
import 'package:medical_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class HomeBannerController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  BannerListModel _bannerListModel = BannerListModel();

  BannerListModel get bannerListModal => _bannerListModel;

  Future<bool> getBannerList() async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.homeBanner);
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      _bannerListModel = BannerListModel.fromJson(networkResponse.responseData);
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
