import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/core/cubit/indicator_cubit.dart';
import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:book_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/bloc/bookshelf_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});

  final UserEntities user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabcontroller = TabController(length: 3, vsync: this);
    final GlobalKey<ScaffoldState> key = GlobalKey();

    return Scaffold(
      key: key,
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Column(
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(100),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://ui-avatars.com/api/?name=${widget.user.username}&size=512",
                  ),
                  maxRadius: 60,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.user.username.toString(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 5),
              Text(
                "Join At : ${widget.user.createdAt}",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  "Setting",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 45),
              Divider(color: AppColor.primary, thickness: 2),
              Text("Active Feature", style: TextStyle(fontSize: 16)),
              Spacer(flex: 3),
              Divider(color: AppColor.primary, thickness: 2),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondary,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
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
                        onTap: () {
                          key.currentState!.openDrawer();
                        },
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
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: NetworkImage(
                          "https://ui-avatars.com/api/?name=${widget.user.username}&size=512",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Hello ${widget.user.username}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: BlocBuilder<BookshelfBloc, BookshelfState>(
                  bloc: context.read<BookshelfBloc>()..add(GetQuotesEvent()),
                  builder: (context, state) {
                    if (state is LoadingGetQuotesState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 150,
                            height: 20,
                            color: Colors.grey.shade200,
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 70,
                            height: 20,
                            color: Colors.grey.shade200,
                          ),
                        ],
                      );
                    } else if (state is SuccessGetQuotesState) {
                      return Text.rich(
                        textAlign: TextAlign.end,
                        TextSpan(
                          text: '"${state.quotes.quote}"\n',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                          children: [
                            TextSpan(
                              text: "-- ${state.quotes.author} --",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }
                    return Text(
                      "Something Wrong",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              BlocBuilder<IndicatorCubit, IndicatorState>(
                bloc: context.read<IndicatorCubit>(),
                builder: (context, state) {
                  state as ActiveIndicatorState;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TabBar(
                          controller: tabcontroller,
                          labelStyle: TextStyle(fontSize: 16),
                          labelColor: AppColor.primary,
                          unselectedLabelColor: Colors.black45,
                          indicatorColor: Colors.transparent,
                          labelPadding: EdgeInsets.zero,
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          onTap: (value) {
                            context
                                .read<IndicatorCubit>()
                                .setActiveIndicatorValue(value);
                          },
                          tabs: [
                            Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color:
                                        state.activeVal == 0
                                            ? AppColor.primary
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text("Trending"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color:
                                        state.activeVal == 1
                                            ? AppColor.primary
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text("Romance"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 5,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color:
                                        state.activeVal == 2
                                            ? AppColor.primary
                                            : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text("Textbooks"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          // padding: EdgeInsets.symmetric(
                          //   vertical: 10,
                          //   horizontal: 15,
                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "Bookmark",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: tabcontroller,
                  children: [
                    BlocBuilder<BookshelfBloc, BookshelfState>(
                      bloc:
                          context.read<BookshelfBloc>()
                            ..add(GetTrendingBookEvent()),
                      builder: (context, state) {
                        if (state is LoadingGetTrendingBookState) {
                          return MasonryGridView.builder(
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            itemCount: 10,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: index == 1 ? 40 : 0,
                                ),
                                child: Container(
                                  height: 270,
                                  decoration: BoxDecoration(
                                    color: AppColor.secondary,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          top: 5,
                                        ),
                                        child: Container(
                                          width: 30,
                                          height: 5,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                          width: 30,
                                          height: 5,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (state is SuccessGetTrendingBook) {
                          return MasonryGridView.builder(
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                            itemCount: 10,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: index == 1 ? 40 : 0,
                                ),
                                child: Container(
                                  height: 270,
                                  decoration: BoxDecoration(
                                    color: AppColor.secondary,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 220,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          top: 5,
                                        ),
                                        child: Text(
                                          "Book Title",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          "Author : Author Name",
                                          style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        return Text(
                          "Something Wrong",
                          style: TextStyle(fontSize: 14, color: Colors.black45),
                        );
                      },
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
