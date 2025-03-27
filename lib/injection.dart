import 'package:book_app/core/cubit/indicator_cubit.dart';
import 'package:book_app/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:book_app/features/auth/data/repositories/repository_impl.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:book_app/features/auth/domain/usecases/auth_add.dart';
import 'package:book_app/features/auth/domain/usecases/auth_get.dart';
import 'package:book_app/features/auth/domain/usecases/auth_login.dart';
import 'package:book_app/features/auth/domain/usecases/auth_signup.dart';
import 'package:book_app/features/auth/domain/usecases/auth_credential.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/bookshelf/data/datasources/remote/book_remote_datasource.dart';
import 'package:book_app/features/bookshelf/data/repositories/book_repository_impl.dart';
import 'package:book_app/features/bookshelf/domain/repositories/book_repository.dart';
import 'package:book_app/features/bookshelf/domain/usecases/quotes_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/romance_book_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/text_book_get.dart';
import 'package:book_app/features/bookshelf/domain/usecases/trending_book_get.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/feature_cubit/feature_cubit.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/quotes_bloc/quotes_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/romance_bloc/romance_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/textbook_bloc/textbook_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/trending_bloc/trending_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // info : BLOC
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => IndicatorCubit());
  sl.registerFactory(() => QuotesBloc(sl()));
  sl.registerFactory(() => TrendingBloc(sl()));
  sl.registerFactory(() => RomanceBloc(sl()));
  sl.registerFactory(() => TextbookBloc(sl()));
  sl.registerFactory(() => FeatureCubit());

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

  // info : REPOSITORIES
  sl.registerLazySingleton<AuthRepository>(() => RepositoryImpl(sl()));
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(sl()));

  // info : DATASOURCE
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl(), sl()),
  );
  sl.registerLazySingleton<BookRemoteDatasource>(
    () => BookRemoteDatasourceImpl(),
  );
}
