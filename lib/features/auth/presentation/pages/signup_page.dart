import 'package:book_app/common/navigator/app_navigator.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/auth/presentation/pages/login_page.dart';
import 'package:book_app/features/auth/presentation/widgets/title_password_text_field.dart';
import 'package:book_app/features/auth/presentation/widgets/title_text_field.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset("assets/logo/logo_b.png", height: 300),
            Text("Good Morning", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            titleTextField("Username", "John Doe", nameC),
            SizedBox(height: 20),
            titleTextField("Email", "johndoe@gmail.com", emailC),
            SizedBox(height: 20),
            titlePasswordTextField("Password", "Password", passC),
            SizedBox(height: 45),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is SuccessSignupAuthState) {
                  AppNavigator.pushRemove(context, HomePage(user: state.user));
                } else if (state is ErrorSignupAuthState) {
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
                if (state is LoadingSignupAuthState) {
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
                      SignupClickAuthEvent(
                        username: nameC.text,
                        email: emailC.text,
                        password: passC.text,
                      ),
                    );
                  },
                  child: Text(
                    "Signup",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Spacer(),
                Text("already have account ", style: TextStyle(fontSize: 14)),
                GestureDetector(
                  onTap: () {
                    AppNavigator.pushRemove(context, LoginPage());
                  },
                  child: Text(
                    "login",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
