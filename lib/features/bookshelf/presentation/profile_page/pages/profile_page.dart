import 'package:book_app/common/navigator/app_navigator.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/core/config/app_theme.dart';
import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:book_app/features/auth/presentation/pages/switch_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});

  final UserEntities user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      appBar: AppTheme.defAppbar("Profile", context),
      body: Padding(
        padding: AppTheme.defPadding,
        child: Column(
          children: [
            Hero(
              tag: "profile-image",
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(100),
                child: CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    "https://ui-avatars.com/api/?name=${user.username}&size=512",
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Divider(color: AppColor.primary),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Name :", style: TextStyle(fontSize: 16)),
                Spacer(),
                Text(
                  user.username.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black45),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Email :", style: TextStyle(fontSize: 16)),
                Spacer(),
                Text(
                  user.email.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black45),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("User ID :", style: TextStyle(fontSize: 16)),
                Spacer(),
                Text(
                  user.id.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.black45),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(color: AppColor.primary),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                AppNavigator.pushRemove(context, SwitchPage());
              },
              label: Text(
                'Signout',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: Size(350, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              iconAlignment: IconAlignment.end,
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
