import 'package:book_app/common/feature/cubit/feature_cubit.dart';
import 'package:book_app/common/navigator/app_navigator.dart';
import 'package:book_app/common/time/time.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/common/indicator/cubit/indicator_cubit.dart';
import 'package:book_app/core/config/app_theme.dart';
import 'package:book_app/features/auth/domain/entities/user_entities.dart';
import 'package:book_app/features/auth/presentation/pages/switch_page.dart';

import 'package:book_app/features/bookshelf/presentation/bookmark_page/pages/bookmark_page.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/widgets/feature_switch.dart';
import 'package:book_app/features/bookshelf/presentation/profile_page/pages/profile_page.dart';
import 'package:book_app/features/bookshelf/presentation/search_page/pages/search_page.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/quotes_bloc/quotes_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    TabController tabcontroller = TabController(
      length: context.read<FeatureCubit>().activeFeature.length,
      vsync: this,
    );
    final GlobalKey<ScaffoldState> key = GlobalKey();

    return Scaffold(
      backgroundColor: AppColor.secondary,
      key: key,
      drawer: Drawer(
        backgroundColor: AppColor.secondary,
        child: Padding(
          padding: EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Column(
            children: [
              Hero(
                tag: 'profile-image',
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(100),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      "https://ui-avatars.com/api/?name=${widget.user.username}&size=512",
                    ),
                    maxRadius: 60,
                  ),
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
                onPressed: () {
                  AppNavigator.push(context, ProfilePage(user: widget.user));
                },
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
              BlocBuilder<FeatureCubit, FeatureState>(
                bloc: context.read<FeatureCubit>(),
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          context.read<FeatureCubit>().activeFeature.length,
                          (index) {
                            return Column(
                              children: [
                                Text(
                                  context
                                      .read<FeatureCubit>()
                                      .activeFeature[index],
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                      ),
                      Column(
                        children: List.generate(
                          context.read<FeatureCubit>().deactiveFeature.length,
                          (index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      context
                                          .read<FeatureCubit>()
                                          .deactiveFeature[index],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.read<FeatureCubit>().addFeature(
                                          context
                                              .read<FeatureCubit>()
                                              .deactiveFeature[index],
                                        );
                                      },
                                      child: Icon(Icons.add),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              Spacer(flex: 10),
              Divider(color: AppColor.primary, thickness: 2),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  AppNavigator.pushRemove(context, SwitchPage());
                },
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
          padding: AppTheme.defPadding,
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
                      Text(Time().timeStatus(), style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppNavigator.push(context, SearchPage());
                        },
                        child: Icon(Icons.search, size: 28),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          AppNavigator.push(
                            context,
                            ProfilePage(user: widget.user),
                          );
                        },
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: NetworkImage(
                            "https://ui-avatars.com/api/?name=${widget.user.username}&size=512",
                          ),
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
                child: BlocBuilder<QuotesBloc, QuotesState>(
                  bloc: context.read<QuotesBloc>()..add(GetQuotesEvent()),
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
                builder: (context, indicatorState) {
                  indicatorState as ActiveIndicatorState;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: BlocBuilder<FeatureCubit, FeatureState>(
                          bloc: context.read<FeatureCubit>(),
                          builder: (context, state) {
                            if (state is LoadingGetFeatureState ||
                                state is LoadingAddandRemoveFeatureState) {
                              return CupertinoActivityIndicator();
                            } else if (state is SuccessGetFeatureState ||
                                state is SuccessAddandRemoveFeatureState) {
                              return TabBar(
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
                                tabs:
                                    context
                                        .read<FeatureCubit>()
                                        .activeFeature
                                        .asMap()
                                        .entries
                                        .map(
                                          (e) => Row(
                                            children: [
                                              Container(
                                                width: 5,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color:
                                                      indicatorState
                                                                  .activeVal ==
                                                              e.key
                                                          ? AppColor.primary
                                                          : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Expanded(
                                                child: Text(
                                                  e.value,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList(),
                              );
                            }
                            return SizedBox();
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          AppNavigator.push(context, BookmarkPage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
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
                child: BlocBuilder<FeatureCubit, FeatureState>(
                  builder: (context, state) {
                    return TabBarView(
                      controller: tabcontroller,
                      children:
                          context.read<FeatureCubit>().activeFeature.map((e) {
                            return featureSwitch(e);
                          }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
