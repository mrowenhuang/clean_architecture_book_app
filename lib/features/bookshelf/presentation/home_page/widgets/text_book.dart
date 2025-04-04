import 'package:book_app/common/favorite/cubit/fav_cubit.dart';
import 'package:book_app/common/widget/mansory_view.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/bookshelf/presentation/bookmark_page/bloc/bookmark_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/home_page/bloc/textbook_bloc/textbook_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget textBook() {
  return BlocBuilder<BookmarkBloc, BookmarkState>(
    builder: (context, bookmarkState) {
      return BlocBuilder<TextbookBloc, TextbookState>(
        bloc: context.read<TextbookBloc>()..add(GetTextbookEvent()),
        builder: (context, state) {
          if (state is LoadingGetTextbookState) {
            return Center(
              child: CupertinoActivityIndicator(color: AppColor.primary),
            );
          } else if (state is SuccessGetTextbookState) {
            return BlocBuilder<FavCubit, FavState>(
              builder: (context, favstate) {
                return MasonryGridView.builder(
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
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
                          (element) => element.key == data.key ? true : false,
                        );
                      }
                    }
                    return mansoryView(index, data, context);
                  },
                );
              },
            );
          }
          return Text(
            "Something Wrong",
            style: TextStyle(fontSize: 14, color: Colors.black45),
          );
        },
      );
    },
  );
}
