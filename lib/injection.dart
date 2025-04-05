import 'package:book_app/common/data/datasources/local/common_local_datasources.dart';
import 'package:book_app/common/data/repositories/common_repositories_impl.dart';
import 'package:book_app/common/domain/repositories/common_repositories.dart';
import 'package:book_app/common/domain/usecase/feature_get.dart';
import 'package:book_app/common/domain/usecase/feature_save.dart';
import 'package:book_app/common/favorite/cubit/fav_cubit.dart';
import 'package:book_app/common/feature/cubit/feature_cubit.dart';
import 'package:book_app/common/indicator/cubit/indicator_cubit.dart';
import 'package:book_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:book_app/features/auth/data/repositories/repository_impl.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:book_app/features/auth/domain/usecases/auth_add.dart';
import 'package:book_app/features/auth/domain/usecases/auth_get.dart';
import 'package:book_app/features/auth/domain/usecases/auth_login.dart';
import 'package:book_app/features/auth/domain/usecases/auth_signup.dart';
import 'package:book_app/features/auth/domain/usecases/auth_credential.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/bookshelf/data/datasources/local/book_local_datasource.dart';
import 'package:book_app/features/bookshelf/data/datasources/remote/book_remote_datasource.dart';
import 'package:book_app/features/bookshelf/data/models/bookmark_models.dart';
import 'package:book_app/features/bookshelf/data/repositories/book_repository_impl.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:book_app/features/bookshelf/domain/usecases/bookmark_add_and_remove.dart';
import 'package:book_app/features/bookshelf/domain/usecases/bookmark_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/detail_book_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/literature_book_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/programming_book_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/quotes_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/romance_book_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/text_book_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/thrillers_book_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/trending_book_get.dart';
import 'package:book_app/features/bookshelf/presentation/bookmark_page/bloc/bookmark_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/detail_page/bloc/detail_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/literature_bloc/literature_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/programming_bloc/programming_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/quotes_bloc/quotes_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/romance_bloc/romance_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/textbook_bloc/textbook_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/thrillers_bloc/thrillers_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/trending_bloc/trending_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/search_page/bloc/search_bloc.dart';

import 'package:book_app/features/bookshelf/domain/usecases/search_book_get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  Hive.registerAdapter(BookmarkModelsAdapter());
  var box = await Hive.openBox("bookmark");

  sl.registerLazySingleton(() => box);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // info : BLOC
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => IndicatorCubit());
  sl.registerFactory(() => QuotesBloc(sl()));
  sl.registerFactory(() => TrendingBloc(sl()));
  sl.registerFactory(() => RomanceBloc(sl()));
  sl.registerFactory(() => TextbookBloc(sl()));
  sl.registerFactory(() => FavCubit(sl()));
  sl.registerFactory(() => SearchBloc(sl()));
  sl.registerFactory(() => BookmarkBloc(sl()));
  sl.registerFactory(() => FeatureCubit(sl(), sl()));
  sl.registerFactory(() => DetailBloc(sl()));
  sl.registerFactory(() => ThrillersBloc(sl()));
  sl.registerFactory(() => ProgrammingBloc(sl()));
  sl.registerFactory(() => LiteratureBloc(sl()));

  // info : USECASE
  sl.registerLazySingleton(() => AuthLogin(sl()));
  sl.registerLazySingleton(() => AuthSignup(sl()));
  sl.registerLazySingleton(() => AuthCredentials(sl()));
  sl.registerLazySingleton(() => AuthGet(sl()));
  sl.registerLazySingleton(() => AuthAdd(sl()));
  sl.registerLazySingleton(() => TrendingBookGet(sl()));
  sl.registerLazySingleton(() => QuotesGet(sl()));
  sl.registerLazySingleton(() => RomanceBookGet(sl()));
  sl.registerLazySingleton(() => TextBookGet(sl()));
  sl.registerLazySingleton(() => SearchBookGet(sl()));
  sl.registerLazySingleton(() => BookmarkAddAndRemove(sl()));
  sl.registerLazySingleton(() => BookmarkGet(sl()));
  sl.registerLazySingleton(() => DetailBookGet(sl()));
  sl.registerLazySingleton(() => LiteratureBookGet(sl()));
  sl.registerLazySingleton(() => ProgrammingBookGet(sl()));
  sl.registerLazySingleton(() => ThrillersBookGet(sl()));
  sl.registerLazySingleton(() => FeatureSave(sl()));
  sl.registerLazySingleton(() => FeatureGet(sl()));

  // info : REPOSITORIES
  sl.registerLazySingleton<AuthRepository>(() => RepositoryImpl(sl()));
  sl.registerLazySingleton<BookRepository>(
    () => BookRepositoryImpl(sl(), sl(), sl()),
  );
  sl.registerLazySingleton<CommonRepositories>(
    () => CommonRepositoriesImpl(sl(), sl()),
  );

  // info : DATASOURCE
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl(), sl()),
  );
  sl.registerLazySingleton<BookRemoteDatasource>(
    () => BookRemoteDatasourceImpl(),
  );
  sl.registerLazySingleton<BookLocalDatasource>(
    () => BookLocalDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<CommonLocalDatasources>(
    () => CommonLocalDatasourcesImpl(sl()),
  );
}
