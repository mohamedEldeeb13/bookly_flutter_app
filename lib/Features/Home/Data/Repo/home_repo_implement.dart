import 'package:bookly_flutter_app/Core/Errors/failure.dart';
import 'package:bookly_flutter_app/Core/Network/base_consumer.dart';
import 'package:bookly_flutter_app/Core/Network/urls.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Models/book/book.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplement implements HomeRepo {
  final BaseConsumer baseConsumer;

  HomeRepoImplement(this.baseConsumer);

  @override
  Future<Either<Failure, List<Book>>> fetchNewestBooks() async {
    try {
      final response = await baseConsumer
          .getData<Map<String, dynamic>>(URLs().getFeaturedBooksURL());

      if (response.isSuccessRequest && response.data != null) {
        final books = (response.data!['items'] as List)
            .map((item) => Book.fromJson(item))
            .toList();
        return right(books);
      }
      return left(ServerFailure(response.statusMessage ?? "Unknown error"));
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    try {
      final response = await baseConsumer
          .getData<Map<String, dynamic>>(URLs().getFeaturedBooksURL());

      if (response.isSuccessRequest && response.data != null) {
        final books = (response.data!['items'] as List)
            .map((item) => Book.fromJson(item))
            .toList();
        return right(books);
      }
      return left(ServerFailure(response.statusMessage ?? "Unknown error"));
    } catch (e) {
      return left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      final response = await baseConsumer.getData<Map<String, dynamic>>(
          URLs().getSimilarBooksURL(category: category));

      if (response.isSuccessRequest && response.data != null) {
        final books = (response.data!['items'] as List)
            .map((item) => Book.fromJson(item))
            .toList();
        return right(books);
      }
      return left(ServerFailure(response.statusMessage ?? "Unknown error"));
    } catch (e) {
      return left(_handleError(e));
    }
  }

  Failure _handleError(Object error) {
    if (error is DioException) {
      return ServerFailure.fromDioException(error);
    }
    return ServerFailure(error.toString());
  }
}
