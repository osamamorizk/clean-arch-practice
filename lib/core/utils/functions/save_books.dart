import 'package:clean_arch_practice/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooks(List<BookEntity> books, String boxName) {
  Box<BookEntity> box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
