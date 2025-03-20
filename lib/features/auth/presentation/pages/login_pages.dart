import 'package:book_app/features/auth/data/datasources/remote/remote_datasource.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailC = TextEditingController();
    final TextEditingController passC = TextEditingController();
    final TextEditingController nameC = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameC,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailC,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passC,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                  LoginClickAuthEvent(email: emailC.text, password: passC.text),
                );
              },
              child: Text("signin"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                  SignupClickAuthEvent(
                    email: emailC.text,
                    password: passC.text,
                    username: nameC.text,
                  ),
                );
              },
              child: Text("signup"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // RemoteDatasourceImpl(
                //   FirebaseFirestore.instance,
                // ).addAuthData(emailC.text, passC.text, nameC.text);
              },
              child: Text("create acc"),
            ),
            SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () {
            //     RemoteDatasourceImpl(FirebaseFirestore.instance).getAuthData();
            //   },
            //   child: Text("get acc"),
            // ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
              },
              child: Text("logout"),
            ),
          ],
        ),
      ),
    );
  }
}
