// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plano/app_constans.dart';
import 'package:plano/data_provider/local/my_config_cache.dart';
import '../local/my_config_cache_keys.dart';

class DioHelper {
  Dio dio = Dio();

  Future<Response> getData({required String endPoint}) async {
    Response response = await dio.get(
      AppConstants.baseUrl + endPoint,
      options: Options(
        headers: {
          "authorization":
              "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
        },
      ),
    );
    return response;
  }

  Future<Response> postData({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        AppConstants.baseUrl + endPoint,
        data: body,
        options: Options(
          headers: {
            "authorization":
                "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
          },
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> postDataWithoutAuth({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        AppConstants.baseUrl + endPoint,
        data: body,
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> postDataForPayment({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    print('Started');
    Response response = await dio.post(
      AppConstants.baseUrl + endPoint,
      // queryParameters: body,
      data: body,
      options: Options(
        headers: {
          "authorization":
              "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
        },
      ),
    );
    print('Ended');
    return response;
  }

  Future<Response> putDataProfile({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    print('data 2');
    return await dio.put('${AppConstants.baseUrl}$endPoint',
        queryParameters: body,
        options: Options(
          headers: {
            "authorization":
                "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
          },
        ));
  }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    print('data 2');
    return await dio.put('${AppConstants.baseUrl}$endPoint',
        data: body,
        options: Options(
          headers: {
            "authorization":
                "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
          },
        ));
    print('data3');
  }

  /// Cart
  Future<Response> deleteFromCart({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    // print('data 2');
    return await dio.put('$AppConstants.baseUrl$endPoint',
        data: body,
        options: Options(
          headers: {
            "authorization":
                "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
          },
        ));
    // print('data3');
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? body,
    // String? token,
  }) async {
    return await dio.delete(
      AppConstants.baseUrl + endPoint,
      data: body,
      options: Options(
        headers: {
          "authorization":
              "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
        },
      ),
    );
  }

  static void logout(BuildContext context) async {
    await MyConfigCach.clearShared();
    Navigator.pushReplacementNamed(context, 'checkScreen');
  }
}
