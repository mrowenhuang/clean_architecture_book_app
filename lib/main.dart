import 'package:book_app/core/config/app_theme.dart';
import 'package:book_app/core/cubit/indicator_cubit.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/auth/presentation/pages/switch_page.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/feature_cubit/feature_cubit.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/quotes_bloc/quotes_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/romance_bloc/romance_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/textbook_bloc/textbook_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/trending_bloc/trending_bloc.dart';
import 'package:book_app/features/search_bookshelf/presentation/bloc/search_bookshelf_bloc.dart';
import 'package:book_app/features/search_bookshelf/presentation/pages/search_page.dart';
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
        BlocProvider(create: (context) => sl<IndicatorCubit>()),
        BlocProvider(create: (context) => sl<TrendingBloc>()),
        BlocProvider(create: (context) => sl<QuotesBloc>()),
        BlocProvider(create: (context) => sl<RomanceBloc>()),
        BlocProvider(create: (context) => sl<TextbookBloc>()),
        BlocProvider(create: (context) => sl<FeatureCubit>()),
        BlocProvider(create: (context) => sl<SearchBookshelfBloc>()),
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
