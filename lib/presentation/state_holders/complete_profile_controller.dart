import 'package:medical_app/data/models/create_profile_params.dart';
import 'package:medical_app/data/models/network_response.dart';
import 'package:medical_app/data/models/profile.dart';
import 'package:medical_app/data/services/network_caller.dart';
import 'package:medical_app/data/utilities/urls.dart';
import 'package:medical_app/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _msg = "Something Went Wrong!!";

  String get msg => _msg;

  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> completeProfile(String token, CreateProfileParams params) async {
    _inProgress = true;
    update();

    NetworkResponse networkResponse = await NetworkCaller()
        .postRequest(Urls.completeProfile, token: token, body: params.toJson());
    _inProgress = false;
    if (networkResponse.isSuccess &&
        networkResponse.responseData["msg"] == "success") {
      update();
      _profile = Profile.fromJson(networkResponse.responseData['data']);
      Get.find<AuthController>().saveUserDetails(token, _profile);
      return true;
    } else {
      _msg = networkResponse.msg;
      update();
      return false;
    }
  }
}
