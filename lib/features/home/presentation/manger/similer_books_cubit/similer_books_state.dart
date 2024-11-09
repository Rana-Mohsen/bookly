part of 'similer_books_cubit.dart';

abstract class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

class SimilerBooksInitial extends SimilerBooksState {}

class SimilarBooksFailure extends SimilerBooksState {
  final String errMessage;

  const SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SimilerBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SimilerBooksState {}