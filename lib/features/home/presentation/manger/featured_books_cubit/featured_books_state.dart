part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}

final class FeaturdBooksPaginationLoading extends FeaturedBooksState {}

final class FeaturdBooksPaginationFailure extends FeaturedBooksState {
  final String message;

  FeaturdBooksPaginationFailure(this.message);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String message;

  FeaturedBooksFailure(this.message);
}
