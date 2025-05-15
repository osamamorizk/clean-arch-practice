import 'package:clean_arch_practice/core/errors/failure.dart';
import 'package:clean_arch_practice/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_practice/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FeatchNewestBooksUseCase {
  final HomeRepo homeRepo;

  FeatchNewestBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> call() {
    //here to write additional code if needed befor applay the fun impl//
    return homeRepo.featchNewstBooks();
  }
}
