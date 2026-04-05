import 'package:get_it/get_it.dart';
import 'package:tminus1/features/markets/domain/repo/markets_repo.dart';
import 'package:tminus1/features/markets/domain/usecase/get_markets_usecase.dart';
import 'package:tminus1/features/markets/presentation/logic/markets_cubit.dart';
import 'package:tminus1/features/wallets/data/datasorce/wallet_local_datasource.dart';
import 'package:tminus1/features/wallets/data/repo/wallet_repo_impl.dart';
import 'package:tminus1/features/wallets/domian/wallet_repo.dart';
import 'package:tminus1/features/wallets/presentation/logic/wallet_cubit.dart';

import '../../features/home/data/datasource/home_remote_datasource.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/domain/repo/home_repo.dart';
import '../../features/home/domain/usecase/get_coins_usecase.dart';
import '../../features/home/presentation/logic/home_cubit.dart';
import '../../features/markets/data/datasource/markets_remote_datasource.dart';
import '../../features/markets/data/repo/markets_repo_impl.dart';
import '../local/app_database.dart';
import '../networking/dio_factory.dart';

final GetIt sl = GetIt.instance;

Future<void> initDi() async {
  //Dio
  sl.registerLazySingleton(() => DioFactory.getDio());

  //Database
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase.instance);

  //Home
  sl.registerLazySingleton<HomeRemoteDatasource>(() => HomeRemoteDatasource(dio: sl()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(datasource: sl()));
  sl.registerLazySingleton<GetCoinsUseCase>(() => GetCoinsUseCase(repository: sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(getCoinsUseCase: sl()));

  //Markets
  sl.registerLazySingleton<MarketsRemoteDatasource>(() => MarketsRemoteDatasource(dio: sl()));
  sl.registerLazySingleton<MarketsRepo>(() => MarketsRepoImpl(datasource: sl()));
  sl.registerLazySingleton<GetMarketsUseCase>(() => GetMarketsUseCase(repository: sl()));
  sl.registerFactory<MarketsCubit>(() => MarketsCubit(getAllMarketsUseCase: sl(), repository: sl()));

  //Wallets
  sl.registerLazySingleton<WalletLocalDataSource>(() => WalletLocalDataSource(db: sl()));
  sl.registerLazySingleton<WalletRepo>(() => WalletRepoImpl(localDataSource: sl()));
  sl.registerFactory<WalletCubit>(() => WalletCubit(repository: sl()));
}