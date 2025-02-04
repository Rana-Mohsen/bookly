import 'package:bookly/core/errors/failuers.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repo_impl_test.mocks.dart';
import 'mock_data.dart';

@GenerateMocks([ApiService])
void main() {
  late HomeRepoImpl homeRepoImpl;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    homeRepoImpl = HomeRepoImpl(mockApiService);
  });

  group('fetch best seller books TEST: ', () {
    test('fetch succeeded', () async {
      const mockData = mockBestSellerApiResponse;
      const endpoint =
          'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science';
      when(mockApiService.get(endpoint: endpoint))
          .thenAnswer((_) async => mockData); // Ensure Future is returned

      // Act
      final result = await homeRepoImpl.fetchBestSellerBooks();

      // Assert
      result.fold((failure) => null, (books) {
        //expect(result, isA<Right>());

        expect(books, isA<List<BookModel>>());
      });
    });

    test('fetch failed with Dio error', () async {
      const endpoint =
          'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science';
      when(mockApiService.get(endpoint: endpoint)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: endpoint),
        ),
      );

      // Act
      final result = await homeRepoImpl.fetchBestSellerBooks();

      // Assert
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (books) => expect(books, isNull),
      );
    });

    test('fetch failed with unkown error', () async {
      const endpoint =
          'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science';
      when(mockApiService.get(endpoint: endpoint)).thenThrow(
        Exception('Unexpected error'),
      );

      // Act
      final result = await homeRepoImpl.fetchBestSellerBooks();

      // Assert
      result.fold(
        (failure) => expect(failure, isA<ServerFailure>()),
        (books) => expect(books, isNull),
      );
    });
  });
}
