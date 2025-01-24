import 'dart:core';
import 'package:dio/dio.dart';

class ErrorHandlerService {
  // Main method to handle errors
  static String handleError(dynamic error) {
    if (error is DioException) {
      // Handling Dio errors (from Dio package)
      return _handleDioError(error);
    } else if (error is Exception) {
      // Handle general Dart exceptions
      return 'An unexpected error occurred: ${error.toString()}';
    } else if (error is FormatException) {
      // Handle FormatException, if any (e.g., invalid response format)
      return 'Data format error: ${error.message}';
    } else {
      // For any unknown error type
      return 'An unknown error occurred: ${error.toString()}';
    }
  }

  // Handle Dio specific errors
  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again later.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again later.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Please try again later.';
      case DioExceptionType.badResponse:
        return _handleHttpError(error.response?.statusCode);
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred: ${error.message}';
      default:
        return 'Something went wrong. Please try again later.';
    }
  }

  // Handle specific HTTP error codes
  static String _handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad Request. Please check your input.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return 'Forbidden. You don\'t have permission to access this resource.';
      case 404:
        return 'Resource not found. Please try again.';
      case 500:
        return 'Internal Server Error. Please try again later.';
      default:
        return 'HTTP Error $statusCode. Please try again later.';
    }
  }
}
