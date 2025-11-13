import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopverse/core/di/injections.dart';

class DioHelper {
  static Dio get dio => sl<Dio>();

  static Future<Either<String, Response>> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: query,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
      return Right(response);
    } on DioException catch (error) {
      dynamic data = error.response?.data;
      String message = 'Something went wrong, please try again later.';

      if (data is Map && data.containsKey('message')) {
        message = data['message'];
      } else if (data is List && data.isNotEmpty) {
        message = data.first.toString();
      } else if (data is String) {
        message = data;
      }

      return Left(message);
    }
  }

  static Future<Either<String, Response>> postData({
    required String url,
    required dynamic data,
    String? token,
  }) async {
    try {
      debugPrint('📤 Sending Data: $data');

      final Response response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );

      return Right(response);
    } on DioException catch (error) {
      String message = 'Something went wrong, please try again later.';
      debugPrint('❌ DioException Type: ${error.type}');
      debugPrint('❌ DioException Response: ${error.response?.data}');
      debugPrint('❌ DioException StatusCode: ${error.response?.statusCode}');
      debugPrint('🧩 Full Dio Error Data: ${error.response?.data}');
     debugPrint('🧩 Full Dio Error Headers: ${error.response?.headers}');

      if (error.response?.data is Map) {
        final data = error.response?.data;

        // ✅ لو فيه errors جايه من الـ API
        if (data['errors'] != null && data['errors'] is Map) {
          final errors = data['errors'] as Map;

          // نحاول ناخد أول قيمة في الـ Map (عادةً بتكون List)
          if (errors.isNotEmpty) {
            final firstKey = errors.keys.first;
            final value = errors[firstKey];

            if (value is List && value.isNotEmpty) {
              message = value.first.toString();
            } else if (value is String) {
              message = value;
            }
          }
        }
        // ✅ fallback لو مفيش errors لكن فيه message
        else if (data['message'] != null) {
          message = data['message'];
        }
      } else if (error.response?.data is String) {
        message = error.response?.data;
      }

      debugPrint('❌ Dio Error: $message');
      debugPrint('🧩 Full Dio Error Data: ${error.response?.data}');
      return Left(message);
    } catch (e) {
      debugPrint('💥 DioHelper.post error: $e');
      return const Left('Something went wrong, please try again later.');
    }
  }
}
