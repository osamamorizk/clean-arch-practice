import 'package:bloc/bloc.dart';
import 'package:clean_arch_practice/features/home/domain/entities/book_entity.dart';

import 'package:clean_arch_practice/features/home/domain/use_case/featch_featured_book_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featchFeaturedBookUseCase)
    : super(FeaturedBooksInitial());
  final FeatchFeaturedBookUseCase featchFeaturedBookUseCase;

  Future<void> featchFeaturedBooks({int pageNumber = 0}) async {
    pageNumber == 0
        ? emit(FeaturedBooksLoading())
        : emit(FeaturdBooksPaginationLoading());
    var result = await featchFeaturedBookUseCase.call(pageNumber: pageNumber);
    result.fold(
      (failure) =>
          pageNumber == 0
              ? emit(FeaturedBooksFailure(failure.errorMessage))
              : emit(FeaturdBooksPaginationFailure(failure.errorMessage)),
      (books) => emit(FeaturedBooksSuccess(books)),
    );
  }
}
