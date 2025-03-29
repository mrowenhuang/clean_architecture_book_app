import 'package:book_app/common/navigator/app_navigator.dart';
import 'package:book_app/common/time/time.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/auth/presentation/pages/signup_page.dart';
import 'package:book_app/features/auth/presentation/widgets/title_password_text_field.dart';
import 'package:book_app/features/auth/presentation/widgets/title_text_field.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset("assets/logo/logo_b.png", height: 400),
              Text(Time().timeStatus(), style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              titleTextField("Email", "johndoe@gmail.com", emailC),
              SizedBox(height: 20),
              titlePasswordTextField("Password", "Password", passC),
              SizedBox(height: 45),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SuccessLoginAuthState) {
                    AppNavigator.pushRemove(context, HomePage(user: state.user,));
                  } else if (state is ErrorLoginAuthState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                bloc: context.read<AuthBloc>(),
                builder: (context, state) {
                  if (state is LoadingLoginAuthState) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(330, 50),
                        backgroundColor: AppColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: null,
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(330, 50),
                      backgroundColor: AppColor.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      context.read<AuthBloc>().add(
                        LoginClickAuthEvent(
                          email: emailC.text,
                          password: passC.text,
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Spacer(),
                  Text("don't have account ", style: TextStyle(fontSize: 14)),
                  GestureDetector(
                    onTap: () {
                      AppNavigator.pushRemove(context, SignupPage());
                    },
                    child: Text(
                      "register",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
