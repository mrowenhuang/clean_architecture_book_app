import 'package:book_app/core/config/app_theme.dart';
import 'package:book_app/core/cubit/indicator_cubit.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/auth/presentation/pages/switch_page.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/bookshelf_bloc.dart';
import 'package:book_app/firebase_options.dart';
import 'package:book_app/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependecies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(CredentialAuthClickEvent()),
        ),
        BlocProvider(
          create: (context) => sl<IndicatorCubit>()
        ),
        BlocProvider(
          create: (context) => sl<BookshelfBloc>()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme(context),
        home: SwitchPage(),
      ),
    );
  }
}
