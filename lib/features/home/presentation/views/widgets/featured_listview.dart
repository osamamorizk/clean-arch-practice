import 'package:clean_arch_practice/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_practice/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
    required this.books,
    required this.scrollController,
  });
  final List<BookEntity> books;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .28,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BookImage(image: books[index].image),
          );
        },
      ),
    );
  }
}
