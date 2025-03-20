import 'package:book_app/common/navigator/app_navigator.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/auth/presentation/widgets/title_password_text_field.dart';
import 'package:book_app/features/auth/presentation/widgets/title_text_field.dart';
import 'package:book_app/features/bookshelf/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailC = TextEditingController();
    final TextEditingController passC = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset("assets/logo/logo_b.png", height: 400),
              Text("Good Morning", style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              titleTextField("Email", "johndoe@gmail.com", emailC),
              SizedBox(height: 20),
              titlePasswordTextField("Password", "Password", passC),
              SizedBox(height: 45),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SuccessLoginAuthState) {
                    AppNavigator.push(context, HomePage());
                  }
                },
                bloc: context.read<AuthBloc>(),
                builder: (context, state) {
                  if (state is LoadingLoginAuthState) {
                    ElevatedButton(
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
                  } else if (state is ErrorLoginAuthState) {
                    return Text(
                      "Something was wrong",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
                  Text("don't have account", style: TextStyle(fontSize: 14)),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text(
                      "register",
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
