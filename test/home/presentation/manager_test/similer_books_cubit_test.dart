import 'package:bloc_test/bloc_test.dart';
import 'package:bookly/core/errors/failuers.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manager/similer_books_cubit/similer_books_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'featured_books_cubit_test.mocks.dart';

void main() {
  late SimilerBooksCubit similerBooksCubit;
  late HomeRepo mockHomeRepo;
  setUp(() {
    mockHomeRepo = MockHomeRepo();
    similerBooksCubit = SimilerBooksCubit(mockHomeRepo);
  });
  tearDown(
    () => similerBooksCubit.close()
  );
  group("test featured books cubit class", () {
    blocTest<SimilerBooksCubit, SimilerBooksState>(
      'emits [SimilerBooksLoading, SimilerBooksSuccess] when SimilerBooksCubit is added.',
      build: () {
        when(mockHomeRepo.fetchSimilerBooks("science"))
            .thenAnswer((realInvocation) async => const Right(<BookModel>[]));
        return similerBooksCubit;
      },
      act: (cubit) => cubit.fetchSimilarBooks(category: "science"),
      expect: () => <SimilerBooksState>[
        SimilarBooksLoading(),
        const SimilarBooksSuccess(<BookModel>[])
      ],
    );
     blocTest<SimilerBooksCubit, SimilerBooksState>(
      'emits [SimilerBooksLoading, SimilerBooksFailure] when FeaturedBooksCubit is added.',
      build: () {
        when(mockHomeRepo.fetchSimilerBooks("science")).thenAnswer(
          (realInvocation) async => Left(ServerFailure("something went wrong")),
        );
        return similerBooksCubit;
      },
      act: (cubit) => cubit.fetchSimilarBooks(category: "science"),
      expect: () => <SimilerBooksState>[
        SimilarBooksLoading(),
        const SimilarBooksFailure("something went wrong")
      ],
    );
  });
}
