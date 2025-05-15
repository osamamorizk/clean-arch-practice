import 'package:clean_arch_practice/core/utils/api_service.dart';
import 'package:clean_arch_practice/features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_practice/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch_practice/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}
