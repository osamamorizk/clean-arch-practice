import 'package:clean_arch_practice/core/utils/styles.dart';
import 'package:clean_arch_practice/features/home/presentation/views/widgets/similar_listview_books.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 16),
        const SimilarListViewBooks(),
      ],
    );
  }
}
