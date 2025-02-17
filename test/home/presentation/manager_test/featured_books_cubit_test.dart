import 'package:bloc_test/bloc_test.dart';
import 'package:bookly/core/errors/failuers.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'featured_books_cubit_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  late FeaturedBooksCubit featuredBooksCubit;
  late HomeRepo mockHomeRepo;
  setUp(() {
    mockHomeRepo = MockHomeRepo();
    featuredBooksCubit = FeaturedBooksCubit(mockHomeRepo);
  });
  tearDown(() => featuredBooksCubit.close());
  group("test featured books cubit class", () {
    blocTest<FeaturedBooksCubit, FeaturedBooksState>(
      'emits [FeaturedBooksLoading, FeaturedBooksSuccess] when FeaturedBooksCubit is added.',
      build: () {
        when(mockHomeRepo.fetchFeaturedBooks())
            .thenAnswer((realInvocation) async => const Right(<BookModel>[]));
        return featuredBooksCubit;
      },
      act: (cubit) => cubit.fetchFeaturedBooks(),
      expect: () => <FeaturedBooksState>[
        FeaturedBooksLoading(),
        const FeaturedBooksSuccess(<BookModel>[])
      ],
    );

    blocTest<FeaturedBooksCubit, FeaturedBooksState>(
      'emits [FeaturedBooksLoading, FeaturedBooksFailure] when FeaturedBooksCubit is added.',
      build: () {
        when(mockHomeRepo.fetchFeaturedBooks()).thenAnswer(
          (realInvocation) async => Left(ServerFailure("something went wrong")),
        );
        return featuredBooksCubit;
      },
      act: (cubit) => cubit.fetchFeaturedBooks(),
      expect: () => <FeaturedBooksState>[
        FeaturedBooksLoading(),
        const FeaturedBooksFailuer("something went wrong")
      ],
    );
  });
}
