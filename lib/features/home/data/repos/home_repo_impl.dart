import 'package:clean_arch_practice/core/errors/failure.dart';
import 'package:clean_arch_practice/features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_practice/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch_practice/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_practice/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> featchFeaturedBooks() async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> featchNewstBooks() async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }
}
