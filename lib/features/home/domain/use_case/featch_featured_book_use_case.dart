import 'package:clean_arch_practice/core/errors/failure.dart';
import 'package:clean_arch_practice/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_practice/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FeatchFeaturedBookUseCase {
  final HomeRepo homeRepo;

  FeatchFeaturedBookUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> call({int pageNumber = 0}) async {
    //here to write additional code if needed befor applay the fun impl//
    return homeRepo.featchFeaturedBooks(pageNumber: pageNumber);
  }
}
