import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/search_bookshelf/presentation/bloc/search_bookshelf_bloc.dart';
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
      appBar: AppBar(
        title: Text(
          "Search",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: AppColor.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: TextField(
                controller: searchC,
                onSubmitted: (value) {
                  context.read<SearchBookshelfBloc>().add(
                    GetSearchBookshelfEvent(value: searchC.text),
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
              child: BlocBuilder<SearchBookshelfBloc, SearchBookshelfState>(
                bloc: context.read<SearchBookshelfBloc>(),
                builder: (context, state) {
                  if (state is LoadingGetSearchBookshelfState) {
                    return Center(
                      child: CupertinoActivityIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  } else if (state is SuccessGetSearchBookshelfState) {
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
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                  ),
                                  alignment: Alignment.center,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "http://books.google.com/books/content?id=${data.id}&printsec=frontcover&img=1&zoom=3",
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
                                    data.volumeInfo!.title.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
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
                        );
                      },
                    );
                  } else if (state is ErrorGetSearchBookshelfState) {
                    return Center(child: Text('Something Wrong ⚠️⚠️⚠️'));
                  }
                  return Center(child: Text('Start Search .. 🔍🔍'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
