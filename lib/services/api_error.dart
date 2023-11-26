import 'package:dio/dio.dart';

class ApiError implements Exception {
  late String title;
  late String description;

  ApiError({required this.description, required this.title});

  ApiError.withDioError(error) {
    title = 'Error';
    description = '';

    switch (error.type) {
      case DioExceptionType.cancel:
        description = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.connectionTimeout:
        description = 'Connection timed out.';
        break;
      case DioExceptionType.receiveTimeout:
        description = 'Receiving timeout occurred.';
        break;
      case DioExceptionType.sendTimeout:
        description = 'Request send timeout.';
        break;
      case DioExceptionType.badResponse:

        ///
        final statusCode = error.response?.statusCode;
        final message = error.response!.data['message'];
        if (message == null) {
          String newMessage = error.response!.data['error'];
          if (newMessage != null) {
            title = newMessage;
            description = 'Oops something went wrong!';
            return;
          }
        }

        /// We can handle status code here according to our server
        description = 'Oops something went wrong!';

        ///
        break;
      case DioExceptionType.connectionError:
        description = 'Connectivity issue';
        break;
      case DioExceptionType.unknown:
        title = 'Connectivity issue';
        description = 'Please check your internet connection';
        break;
      default:
        description = 'Something went wrong';
        break;
    }
  }

  /// it depends on server that which type of errors are coming
  String _handleStatusCode(int? statusCode, String? message) {
    switch (statusCode) {
      case 400:
        return message ?? 'Bad request.';
      case 401:
        return message ?? 'Authentication failed.';
      case 403:
        return message ??
            'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return message ?? 'The requested resource does not exist.';
      case 409:
        return message ?? 'Account already exist.';
      case 405:
        return message ??
            'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return message ??
            'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return message ?? 'Data validation failed.';
      case 429:
        return message ?? 'Too many requests.';
      case 500:
        return message ?? 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => description;
}
