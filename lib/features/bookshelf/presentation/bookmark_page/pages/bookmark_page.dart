import 'package:book_app/common/favorite/cubit/fav_cubit.dart';
import 'package:book_app/common/widget/mansory_view.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/presentation/bookmark_page/bloc/bookmark_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondary,
      appBar: AppBar(
        title: Text(
          "Bookmark",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded, size: 30),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text("Good Morning", style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: BlocBuilder<BookmarkBloc, BookmarkState>(
              builder: (context, state) {
                if (state is LoadingGetBookmarkState) {
                  return Center(
                    child: CupertinoActivityIndicator(color: AppColor.primary),
                  );
                } else if (state is SuccessGetBookmarkState) {
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
                      final data = state.books[index];
                      return Padding(
                        padding: EdgeInsets.only(top: index == 1 ? 40 : 0),
                        child: Stack(
                          children: [
                            Container(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          "https://covers.openlibrary.org/b/id/${data.key}-L.jpg",
                                      placeholder: (context, url) {
                                        return Center(
                                          child: CupertinoActivityIndicator(
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
                                      data.title.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Author : ${data.authors ?? "--"}",
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
                                    context.read<FavCubit>().addFavEvent(
                                      BookmarkEntities(
                                        authors: data.authors,
                                        title: data.title,
                                        fav: data.fav,
                                        key: data.key,
                                      ),
                                    );
                                  },
                                  child: BlocBuilder<FavCubit, FavState>(
                                    bloc: context.read<FavCubit>(),
                                    builder: (context, state) {
                                      return AnimatedSwitcher(
                                        duration: Duration(microseconds: 500),
                                        transitionBuilder: (child, animation) {
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
                }
                return Center(child: Text("Something was wrong"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
