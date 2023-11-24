import 'package:dartz/dartz.dart';
import 'package:rivo_app/core/errors/failure.dart';

typedef DataResponse<T> = Future<Either<Failure, T>>;
typedef BodyMap = Map<String, dynamic>;
typedef QueryParams = Map<String, String>;
