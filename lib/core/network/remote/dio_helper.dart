import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://store.mansouracademy.com/api/v1/', // Base URL + v1
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      // sendTimeout: const Duration(seconds: 30),
    ),
  );

  // =================== GET ===================
  static Future<Either<String, Map<String, dynamic>>> get({
    required String path,
    Map<String, dynamic>? params,
    String? search,
    String? token,
  }) async {
    try {
      Response response = await _dio.get(
        path,
        queryParameters: {
          if (search != null) 'q': search,
          ...?params,
        },
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(response.data);
    } on DioException catch (e) {
      debugPrint('DioHelper.get DioException: ${e.response?.data}');
      if (e.response != null && e.response!.data['message'] != null) {
        return Left(e.response!.data['message']);
      }
      return Left('Something went wrong, please try again later');
    } catch (e) {
      debugPrint('DioHelper.get error: $e');
      return Left('Something went wrong, please try again later');
    }
  }

  // =================== POST ===================
  static Future<Either<String, Map<String, dynamic>>> post({
    required String path,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      Response response = await _dio.post(
        path,
        data: data,
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(response.data);
    } on DioException catch (e) {
      debugPrint('DioHelper.post DioException: ${e.response?.data}');
      if (e.response != null && e.response!.data['message'] != null) {
        return Left(e.response!.data['message']);
      }
      return Left('Something went wrong, please try again later');
    } catch (e) {
      debugPrint('DioHelper.post error: $e');
      return Left('Something went wrong, please try again later');
    }
  }

  // =================== PUT ===================
  static Future<Either<String, Map<String, dynamic>>> put({
    required String path,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      Response response = await _dio.put(
        path,
        data: data,
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(response.data);
    } on DioException catch (e) {
      debugPrint('DioHelper.put DioException: ${e.response?.data}');
      if (e.response != null && e.response!.data['message'] != null) {
        return Left(e.response!.data['message']);
      }
      return Left('Something went wrong, please try again later');
    } catch (e) {
      debugPrint('DioHelper.put error: $e');
      return Left('Something went wrong, please try again later');
    }
  }

  // =================== PATCH ===================
  static Future<Either<String, Map<String, dynamic>>> patch({
    required String path,
    Map<String, dynamic>? params,
    String? search,
    String? token,
  }) async {
    try {
      Response response = await _dio.patch(
        path,
        queryParameters: {
          if (search != null) 'q': search,
          ...?params,
        },
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(response.data);
    } on DioException catch (e) {
      debugPrint('DioHelper.patch DioException: ${e.response?.data}');
      if (e.response != null && e.response!.data['message'] != null) {
        return Left(e.response!.data['message']);
      }
      return Left('Something went wrong, please try again later');
    } catch (e) {
      debugPrint('DioHelper.patch error: $e');
      return Left('Something went wrong, please try again later');
    }
  }

  // =================== DELETE ===================
  static Future<Either<String, Map<String, dynamic>>> delete({
    required String path,
    String? token,
  }) async {
    try {
      Response response = await _dio.delete(
        path,
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(response.data);
    } on DioException catch (e) {
      debugPrint('DioHelper.delete DioException: ${e.response?.data}');
      if (e.response != null && e.response!.data['message'] != null) {
        return Left(e.response!.data['message']);
      }
      return Left('Something went wrong, please try again later');
    } catch (e) {
      debugPrint('DioHelper.delete error: $e');
      return Left('Something went wrong, please try again later');
    }
  }
}
