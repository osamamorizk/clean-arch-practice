import 'dart:developer';

import 'package:clean_arch_practice/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_practice/features/home/presentation/views/widgets/featured_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksBlocBuilder extends StatefulWidget {
  const FeaturedBooksBlocBuilder({super.key});

  @override
  State<FeaturedBooksBlocBuilder> createState() =>
      _FeaturedBooksBlocBuilderState();
}

class _FeaturedBooksBlocBuilderState extends State<FeaturedBooksBlocBuilder> {
  late final ScrollController _scrollController;
  int pageNumber = 1;
  bool isLoading = false;
  @override
  initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    double currentScrollPosition = _scrollController.position.pixels;
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (currentScrollPosition >= .7 * maxScrollExtent) {
      log('reached the end');
      if (!isLoading) {
        isLoading = true;
        await context.read<FeaturedBooksCubit>().featchFeaturedBooks(
          pageNumber: pageNumber,
        );
        pageNumber++;
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedListView(
            books: state.books,
            scrollController: _scrollController,
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
