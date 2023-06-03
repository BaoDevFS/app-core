import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oauth2/oauth2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_core/app_core.dart';

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<SharedPreferences> getSharePreferences() async => SharedPreferences.getInstance();

}
