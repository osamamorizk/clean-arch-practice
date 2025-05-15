import 'package:clean_arch_practice/core/utils/styles.dart';
import 'package:clean_arch_practice/features/home/presentation/views/widgets/best_seller_listview.dart';
import 'package:clean_arch_practice/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:clean_arch_practice/features/home/presentation/views/widgets/featured_books_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomAppBar(),
              ),
              FeaturedBooksBlocBuilder(),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Best Seller', style: Styles.textStyle18),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
