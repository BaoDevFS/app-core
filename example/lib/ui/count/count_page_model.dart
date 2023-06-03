import 'package:example/injector.dart';
import 'package:example/storage/count_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:app_core/app_core.dart';

class CountPageModel extends BaseViewModel {
  RxInt _count = 10.obs;
  RxString description = 'Your storage is 10'.obs;

  String? email;
  String? code;

  int get count => _count.value;

  @override
  void initState() {
    super.initState();
  }

  void increase() {
    ++_count.value;
    injector<CountStorage>().set(_count.value);
    description.value = "Your storage is ${injector<CountStorage>().get()}";
  }

  Future<Unit> sendOTP() async {
    await Fluttertoast.showToast(msg: 'Send OTP - Start');
    await run(
      () async {
        Map<String, dynamic> params = {};
        params["email"] = email;
      },
      onSuccess: () {
        Fluttertoast.showToast(msg: 'Send OTP - Success');
      },
      onFailure: (error) {
        Fluttertoast.showToast(msg: error.toString());
        debugPrint(error.toString());
      },
    );
    await Fluttertoast.showToast(msg: 'Send OTP - End');
    return unit;
  }

  Future<Unit> login() async {
    return run(() async {
      print('accessToken');
    }, onSuccess: () {
      Fluttertoast.showToast(msg: "Login success!");
    });
  }
}
