import 'package:clean_arch_practice/core/errors/failure.dart';
import 'package:clean_arch_practice/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> featchFeaturedBooks();
  Future<Either<Failure, List<BookEntity>>> featchNewstBooks();
}
