import 'package:book_app/features/auth/data/datasources/remote/remote_datasource.dart';
import 'package:book_app/features/auth/data/repositories/repository_impl.dart';
import 'package:book_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:book_app/features/auth/domain/usecases/auth_login.dart';
import 'package:book_app/features/auth/domain/usecases/auth_signup.dart';
import 'package:book_app/features/auth/domain/usecases/auth_credential.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // info : BLOC
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));

  // info : USECASE
  sl.registerLazySingleton(() => AuthLogin(sl()));
  sl.registerLazySingleton(() => AuthSignup(sl()));
  sl.registerLazySingleton(() => AuthCredential(sl()));

  // info : REPOSITORIES
  sl.registerLazySingleton<AuthRepository>(() => RepositoryImpl(sl()));

  // info : DATASOURCE
  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl(sl()));
}
