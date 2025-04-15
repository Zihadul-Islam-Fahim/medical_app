import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/presentation/state_holders/auth_controller.dart';
import 'package:medical_app/presentation/state_holders/read_profile_data_controller.dart';
import 'package:medical_app/presentation/ui/utility/utils.dart';

import '../../../data/models/create_profile_params.dart';
import '../../state_holders/complete_profile_controller.dart';
import '../widgets/circular_progress_indicator.dart';
import 'auth/verify_email_screen.dart';
import 'main_bottom_nav_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final readProfileController = Get.find<ReadProfileDataController>();
  final authController = Get.find<AuthController>();



  final TextEditingController _cusNameTEController = TextEditingController();
  final TextEditingController _cusAddTEController = TextEditingController();
  final TextEditingController _cusCityEController = TextEditingController();
  final TextEditingController _cusStateTEController = TextEditingController();
  final TextEditingController _cusPostcodeTEController =
  TextEditingController();
  final TextEditingController _cusCountryTEController = TextEditingController();
  final TextEditingController _cusPhoneTEController = TextEditingController();
  final TextEditingController _cusFaxTEController = TextEditingController();
  final TextEditingController _shipNameTEController = TextEditingController();
  final TextEditingController _shipAddTEController = TextEditingController();
  final TextEditingController _shipCityTEController = TextEditingController();
  final TextEditingController _shipStateTEController = TextEditingController();
  final TextEditingController _shipPostcodeTEController =
  TextEditingController();
  final TextEditingController _shipCountryTEController =
  TextEditingController();
  final TextEditingController _shipPhoneTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {

    readProfileController.readProfileData(AuthController.token!);
    


    _cusNameTEController.text = readProfileController.profile.data?.cusName ?? "";
    _cusAddTEController.text = readProfileController.profile.data!.cusAdd!;
    _cusPhoneTEController.text = readProfileController.profile.data!.cusPhone!;
    _shipNameTEController.text = readProfileController.profile.data!.shipName!;
    _shipAddTEController.text = readProfileController.profile.data!.shipAdd!;
    _shipCityTEController.text = readProfileController.profile.data!.shipCity!;
    _shipStateTEController.text = readProfileController.profile.data!.shipState!;
    _shipPhoneTEController.text = readProfileController.profile.data!.shipPhone!;



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: GetBuilder<ReadProfileDataController>(
        builder: (controller) {
          return Visibility(
            visible: controller.inProgress==false,
            replacement: const Center(child: CircularProgressIndicator()),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [



                      const Text("Name:",style: TextStyle(fontSize: 14,fontFamily: 'mn'),),
                      TextFormField(
                        textInputAction: TextInputAction.next,

                        decoration: const InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            fontFamily: 'mn',
                          ),
                        ),
                        controller: _cusNameTEController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Address:",style: TextStyle(fontSize: 14,fontFamily: 'mn'),),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(
                            fontFamily: 'mn',
                          ),
                        ),
                        controller: _cusAddTEController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'enter your address';
                          }
                          return null;
                        },
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   textInputAction: TextInputAction.next,
                      //   keyboardType: TextInputType.text,
                      //   decoration: const InputDecoration(
                      //     hintText: 'City',
                      //     hintStyle: TextStyle(
                      //       fontFamily: 'mn',
                      //     ),
                      //   ),
                      //   controller: _cusCityEController,
                      //   validator: (String? value) {
                      //     if (value!.isEmpty) {
                      //       return 'enter your city';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   textInputAction: TextInputAction.next,
                      //   decoration: const InputDecoration(
                      //     hintText: 'State',
                      //     hintStyle: TextStyle(
                      //       fontFamily: 'mn',
                      //     ),
                      //   ),
                      //   controller: _cusStateTEController,
                      //   validator: (String? value) {
                      //     if (value!.isEmpty) {
                      //       return 'enter your state';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   textInputAction: TextInputAction.done,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Post Code',
                      //     hintStyle: TextStyle(
                      //       fontFamily: 'mn',
                      //     ),
                      //   ),
                      //   controller: _cusPostcodeTEController,
                      //   validator: (String? value) {
                      //     if (value!.isEmpty) {
                      //       return 'enter your post code';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   textInputAction: TextInputAction.done,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Country',
                      //     hintStyle: TextStyle(
                      //       fontFamily: 'mn',
                      //     ),
                      //   ),
                      //   controller: _cusCountryTEController,
                      //   validator: (String? value) {
                      //     if (value!.isEmpty) {
                      //       return 'enter your country';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Phone:",style: TextStyle(fontSize: 14,fontFamily: 'mn'),),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: 'Phone',
                          hintStyle: TextStyle(
                            fontFamily: 'mn',
                          ),
                        ),
                        controller: _cusPhoneTEController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'enter your phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // TextFormField(
                      //   textInputAction: TextInputAction.done,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Fax',
                      //     hintStyle: TextStyle(
                      //       fontFamily: 'mn',
                      //     ),
                      //   ),
                      //   controller: _cusFaxTEController,
                      //   validator: (String? value) {
                      //     if (value!.isEmpty) {
                      //       return 'enter your fax';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),




                      const Text("Shipping auther name:",style: TextStyle(fontSize: 14,fontFamily: 'mn'),),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: 'Shipping author name',
                          hintStyle: TextStyle(
                            fontFamily: 'mn',
                          ),
                        ),
                        controller: _shipNameTEController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'enter your Shipping author name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("shipping address:",style: TextStyle(fontSize: 14,fontFamily: 'mn'),),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: 'Shipping Address',
                          hintStyle: TextStyle(
                            fontFamily: 'mn',
                          ),
                        ),
                        controller: _shipAddTEController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'enter your shipping address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("City and state:",style: TextStyle(fontSize: 14,fontFamily: 'mn'),),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                hintText: 'City',
                                hintStyle: TextStyle(
                                  fontFamily: 'mn',
                                ),
                              ),
                              controller: _shipCityTEController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'enter your ship city';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                hintText: 'State',
                                hintStyle: TextStyle(
                                  fontFamily: 'mn',
                                ),
                              ),
                              controller: _shipStateTEController,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'enter your ship state';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   textInputAction: TextInputAction.done,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Ship postcode',
                      //     hintStyle: TextStyle(
                      //       fontFamily: 'mn',
                      //     ),
                      //   ),
                      //   controller: _shipPostcodeTEController,
                      //   validator: (String? value) {
                      //     if (value!.isEmpty) {
                      //       return 'enter your ship postcode';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // TextFormField(
                      //   textInputAction: TextInputAction.done,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Ship country',
                      //     hintStyle: TextStyle(
                      //       fontFamily: 'mn',
                      //     ),
                      //   ),
                      //   controller: _shipCountryTEController,
                      //   validator: (String? value) {
                      //     if (value!.isEmpty) {
                      //       return 'enter your ship country';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Shipping phone:",style: TextStyle(fontSize: 14,fontFamily: 'mn'),),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: 'Phone',
                          hintStyle: TextStyle(
                            fontFamily: 'mn',
                          ),
                        ),
                        controller: _shipPhoneTEController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'enter your ship phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      GetBuilder<CompleteProfileController>(builder: (controller) {
                        return SizedBox(
                          width: double.infinity,
                          child: Visibility(
                            visible: controller.inProgress == false,
                            replacement: const CenterCircularProgressIndicator(),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final createProfileParams = CreateProfileParams(
                                      cusAdd: _cusAddTEController.text,
                                      cusCity: _cusCityEController.text,
                                      cusCountry: _cusCountryTEController.text,
                                      cusFax: _cusFaxTEController.text,
                                      cusName: _cusNameTEController.text,
                                      cusPhone: _cusPhoneTEController.text,
                                      cusPostcode: _cusPostcodeTEController.text,
                                      cusState: _cusStateTEController.text,
                                      shipAdd: _shipAddTEController.text,
                                      shipCity: _shipCityTEController.text,
                                      shipCountry: _shipCountryTEController.text,
                                      shipName: _shipNameTEController.text,
                                      shipPhone: _shipPhoneTEController.text,
                                      shipPostcode: _shipPostcodeTEController.text,
                                      shipState: _shipStateTEController.text);

                                  bool result = await controller.completeProfile(
                                      AuthController.token!,
                                      createProfileParams);
                                  if (result) {
                                    Get.offAll(() => const MainBottomNavScreen());
                                  } else {
                                    customToast(context, "Profile Update Failed");
                                  }
                                }
                              },
                              child: const Text(
                                'Update Profile',
                                style: TextStyle(
                                  fontFamily: 'mn',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async{
                          await AuthController.clearAuthData();
                          Get.to(() => const VerifyEmailScreen());
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            fontFamily: 'mn',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    _cusAddTEController.dispose();
    _cusCityEController.dispose();
    _cusCountryTEController.dispose();
    _cusFaxTEController.dispose();
    _cusNameTEController.dispose();
    _cusPhoneTEController.dispose();
    _cusPostcodeTEController.dispose();
    _cusStateTEController.dispose();
    _shipAddTEController.dispose();
    _shipCityTEController.dispose();
    _shipCountryTEController.dispose();
    _shipNameTEController.dispose();
    _shipPhoneTEController.dispose();
    _shipPostcodeTEController.dispose();
    _shipStateTEController.dispose();
    super.dispose();
  }
}
