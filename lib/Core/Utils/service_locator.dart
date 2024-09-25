import 'package:bookly_flutter_app/Core/Utils/api_service.dart';
import 'package:bookly_flutter_app/Features/Home/Data/Repo/home_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  /// Api service ///
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  /// home repo implementation ///
  getIt.registerSingleton(HomeRepoImplement(getIt.get<ApiService>()));
}
