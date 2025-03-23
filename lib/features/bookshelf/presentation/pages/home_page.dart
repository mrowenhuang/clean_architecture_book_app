import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.user});

  final UserEntities user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.menu, size: 28),
                      ),
                      SizedBox(width: 15),
                      Text("Good Morning", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.search, size: 28),
                      ),
                      SizedBox(width: 15),
                      CircleAvatar(maxRadius: 25),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Hello ${user.username}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text.rich(
                  textAlign: TextAlign.end,
                  TextSpan(
                    text: '"Quotes of the day"\n',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                    children: [
                      TextSpan(text: "author", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 15,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("Trending", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  Text("Classic", style: TextStyle(fontSize: 16)),
                  Spacer(),
                  Text("Textbooks", style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
