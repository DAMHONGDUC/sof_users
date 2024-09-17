import 'package:dio/dio.dart';

class DioExceptionCustom implements Exception {
  late String errorMessage;

  DioExceptionCustom.fromDioError(DioException dioError) {
    // Map<String, dynamic> dataJson = dioError.response?.data;

    // if (dataJson["message"] != null) {
    //   errorMessage = DioErrorMessage.getErrorMessage(dataJson["message"]);

    //   return;
    // }

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Oops something went wrong!';
        break;
    }
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Authentication failed.';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The requested resource does not exist.';
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return 'Data validation failed.';
      case 429:
        return 'Too many requests.';
      case 500:
        return 'Internal server error.';
      case 503:
        return '503 Service Unavailable.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errorMessage;
}
