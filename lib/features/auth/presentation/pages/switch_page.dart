import 'package:book_app/common/navigator/app_navigator.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/auth/presentation/pages/login_page.dart';
import 'package:book_app/features/bookshelf/presentation/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(stream: , builder: builder);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessLoginAuthState) {
          return AppNavigator.pushRemove(context, HomePage(
            user: state.user,
          ));
        } else if (state is FailedCredentialAuthState) {
          return AppNavigator.pushRemove(context, LoginPage());
        }
      },
      bloc: context.read<AuthBloc>(),
      builder: (context, state) {
        return Scaffold(body: Center(child: CupertinoActivityIndicator()));
      },
    );
  }
}
