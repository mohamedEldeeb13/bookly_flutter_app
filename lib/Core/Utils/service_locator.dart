import 'package:bookly_flutter_app/Core/Network/base_consumer.dart';
import 'package:bookly_flutter_app/Core/Network/dio_consumer.dart';
import 'package:bookly_flutter_app/Core/Network/dio_factory.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Repo/home_repo.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Repo/home_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Ensure Dio is initialized and awaited
  Dio dio = await DioFactory.getDio();
  // Register Dio as a singleton
  getIt.registerSingleton<Dio>(dio);
  // Register DioConsumer as the implementation of BaseConsumer
  getIt.registerLazySingleton<BaseConsumer>(() => DioConsumer(dio));
  // Register HomeRepoImplement which depends on BaseConsumer
  getIt.registerSingleton<HomeRepo>(HomeRepoImplement(getIt<BaseConsumer>()));
}
