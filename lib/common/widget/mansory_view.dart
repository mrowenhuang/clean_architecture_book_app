import 'package:book_app/common/favorite/cubit/fav_cubit.dart';
import 'package:book_app/common/navigator/app_navigator.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/presentation/detail_page/pages/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget mansoryView(int index, FeatureBookEntities data, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: index == 1 ? 40 : 0),
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {
            AppNavigator.push(
              context,
              DetailPage(
                author: data.author?[0] ?? "--",
                coverI: data.coverI.toString(),
                title: data.title,
                workKey: data.key,
                status: data.fav,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://covers.openlibrary.org/b/id/${data.coverI}-L.jpg",
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
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    data.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "Author : ${data.author?[0] ?? "--"}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black45, fontSize: 12),
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
                context.read<FavCubit>().addAndRemoveFavEvent(
                  BookmarkEntities(
                    authors: data.author?[0],
                    title: data.title,
                    fav: data.fav,
                    key: data.key,
                    coverI: data.coverI.toString(),
                  ),
                );
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
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
                          Icons.bookmark_border_outlined,
                          size: 30,
                        ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
