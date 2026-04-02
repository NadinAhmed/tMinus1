import 'package:get_it/get_it.dart';

import '../../features/home/data/datasource/home_remote_datasource.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/domain/repo/home_repo.dart';
import '../../features/home/domain/usecase/get_coins_usecase.dart';
import '../../features/home/presentation/logic/home_cubit.dart';
import '../networking/dio_factory.dart';

final GetIt sl = GetIt.instance;

Future<void> initDi() async {
  //Dio
  sl.registerLazySingleton(() => DioFactory.getDio());

  //Home
  sl.registerLazySingleton<HomeRemoteDatasource>(() => HomeRemoteDatasource(dio: sl()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(datasource: sl()));
  sl.registerLazySingleton<GetCoinsUseCase>(() => GetCoinsUseCase(repository: sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(getCoinsUseCase: sl()));
}