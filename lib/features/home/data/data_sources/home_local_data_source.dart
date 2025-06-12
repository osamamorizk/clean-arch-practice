import 'package:clean_arch_practice/core/utils/consts.dart';
import 'package:clean_arch_practice/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});

  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBooksBox);

    int currentIndex = pageNumber * 10;
    int nextIndex = currentIndex + 10;
    int totalBooks = box.values.length;
    int maxAvilableIndex = nextIndex.clamp(0, totalBooks);

    if (currentIndex >= totalBooks) return [];

    List<BookEntity> books = box.values.toList().sublist(
      currentIndex,
      maxAvilableIndex,
    );
    return books;
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBooksBox);
    List<BookEntity> books = box.values.toList();
    return books;
  }
}
