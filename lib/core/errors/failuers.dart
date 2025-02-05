import 'package:dio/dio.dart';

abstract class Failuers {
  final String errMessage;

  const Failuers(this.errMessage);
}

class ServerFailure extends Failuers {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioExp) {
    switch (dioExp.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        print("1");
        return ServerFailure.fromResponse(
            dioExp.response!.statusCode, dioExp.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
