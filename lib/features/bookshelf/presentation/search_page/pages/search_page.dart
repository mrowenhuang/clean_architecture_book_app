import 'package:book_app/common/favorite/cubit/fav_cubit.dart';
import 'package:book_app/common/navigator/app_navigator.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/core/config/app_theme.dart';
import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/presentation/bookmark_page/bloc/bookmark_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/detail_page/pages/detail_page.dart';
import 'package:book_app/features/bookshelf/presentation/search_page/bloc/search_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final TextEditingController searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      appBar: AppTheme.defAppbar("Search", context),
      body: Padding(
        padding: AppTheme.defPadding,
        child: Column(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: TextField(
                controller: searchC,
                onSubmitted: (value) {
                  context.read<SearchBloc>().add(
                    GetSearchEvent(value: searchC.text),
                  );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Search book",
                  suffixIcon: Icon(Icons.search, color: AppColor.primary),
                  fillColor: AppColor.secondary,
                  filled: true,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<BookmarkBloc, BookmarkState>(
                builder: (context, bookmarkState) {
                  return BlocBuilder<SearchBloc, SearchState>(
                    bloc: context.read<SearchBloc>(),
                    builder: (context, state) {
                      if (state is LoadingGetSearchBookState) {
                        return Center(
                          child: CupertinoActivityIndicator(
                            color: AppColor.primary,
                          ),
                        );
                      } else if (state is SuccessGetSearchBookState) {
                        return MasonryGridView.builder(
                          gridDelegate:
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                          itemCount: state.books.length,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemBuilder: (context, index) {
                            var data = state.books[index];
                            if (bookmarkState is SuccessGetBookmarkState) {
                              if (bookmarkState.books.isEmpty) {
                                data.fav = false;
                              } else {
                                data.fav = bookmarkState.books.any(
                                  (element) =>
                                      element.key == data.id ? true : false,
                                );
                              }
                            }
                            return Padding(
                              padding: EdgeInsets.only(
                                top: index == 1 ? 40 : 0,
                              ),
                              child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      AppNavigator.push(
                                        context,
                                        DetailPage(
                                          author: data.volumeInfo?.authors?[0],
                                          description:
                                              data.volumeInfo?.description,
                                          title: data.volumeInfo?.title,
                                          coverI: data.id,
                                          status: data.fav,
                                          workKey: data.id,
                                        ),
                                      );
                                    },
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
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                            ),
                                            alignment: Alignment.center,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  "http://books.google.com/books/content?id=${data.id}&printsec=frontcover&img=1&zoom=3",
                                              placeholder: (context, url) {
                                                return Center(
                                                  child:
                                                      CupertinoActivityIndicator(
                                                        color: AppColor.primary,
                                                      ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 5,
                                              top: 5,
                                            ),
                                            child: Text(
                                              data.volumeInfo!.title.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 5,
                                            ),
                                            child: Text(
                                              "Author : ${data.volumeInfo!.authors?[0] ?? "--"}",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    top: 5,
                                    child: Container(
                                      height: 50,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(0, 2),
                                            color: Colors.black45,
                                          ),
                                        ],
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          data.fav = !data.fav!;
                                          context
                                              .read<FavCubit>()
                                              .addAndRemoveFavEvent(
                                                BookmarkEntities(
                                                  authors:
                                                      data
                                                          .volumeInfo
                                                          ?.authors?[0],
                                                  title: data.volumeInfo?.title,
                                                  fav: data.fav,
                                                  key: data.id,
                                                  coverI: data.id,
                                                  description:
                                                      data
                                                          .volumeInfo
                                                          ?.description,
                                                ),
                                              );
                                        },
                                        child: BlocBuilder<FavCubit, FavState>(
                                          bloc: context.read<FavCubit>(),
                                          builder: (context, state) {
                                            return AnimatedSwitcher(
                                              duration: Duration(
                                                microseconds: 500,
                                              ),
                                              transitionBuilder: (
                                                child,
                                                animation,
                                              ) {
                                                return FadeTransition(
                                                  opacity: animation,

                                                  child: child,
                                                );
                                              },
                                              child:
                                                  data.fav!
                                                      ? Icon(
                                                        key: ValueKey(1),
                                                        Icons.bookmark_rounded,

                                                        size: 30,
                                                      )
                                                      : Icon(
                                                        key: ValueKey(2),
                                                        Icons
                                                            .bookmark_border_outlined,
                                                        size: 30,
                                                      ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (state is ErrorGetSearchBookState) {
                        return Center(child: Text('Something Wrong ⚠️⚠️⚠️'));
                      }
                      return Center(child: Text('Start Search .. 🔍🔍'));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
