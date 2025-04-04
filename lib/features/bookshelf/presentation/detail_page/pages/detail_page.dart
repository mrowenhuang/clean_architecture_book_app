import 'package:book_app/common/favorite/cubit/fav_cubit.dart';
import 'package:book_app/core/config/app_color.dart';
import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/presentation/bookmark_page/bloc/bookmark_bloc.dart';
import 'package:book_app/features/bookshelf/presentation/detail_page/bloc/detail_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({
    super.key,
    this.title,
    this.author,
    this.coverI,
    this.description,
    this.workKey,
    this.status,
  });
  String? title;
  String? author;
  String? coverI;
  String? description;
  String? workKey;
  bool? status;

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Detail",
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
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Container(
                width: 180,
                height: 250,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(7, 5),
                      blurRadius: 8,
                      color: Colors.black54,
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      workKey!.contains('/')
                          ? "https://covers.openlibrary.org/b/id/$coverI-L.jpg"
                          : "http://books.google.com/books/content?id=$coverI&printsec=frontcover&img=1&zoom=3",
                  placeholder: (context, url) {
                    return Center(
                      child: CupertinoActivityIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(title.toString(), style: TextStyle(fontSize: 20)),
              SizedBox(height: 5),
              Text(
                "Author : $author",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Text("Preview :", style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Expanded(
                child:
                    description == null
                        ? BlocBuilder<DetailBloc, DetailState>(
                          bloc:
                              context.read<DetailBloc>()..add(
                                GetDetailEvent(value: workKey.toString()),
                              ),
                          builder: (context, state) {
                            if (state is LoadingGetDetailBookState) {
                              return Center(
                                child: CupertinoActivityIndicator(),
                              );
                            } else if (state is SuccessGetDetailBookState) {
                              description = state.desc;
                              return ListView(
                                controller: scrollController,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Text(state.desc, textAlign: TextAlign.center),
                                ],
                              );
                            } else if (state is ErrorGetDetailBookState) {
                              return Text("-- No Preview --");
                            }
                            return SizedBox();
                          },
                        )
                        : ListView(
                          controller: scrollController,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Text(
                              description.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
              ),
              SizedBox(height: 30),
              BlocBuilder<FavCubit, FavState>(
                bloc: context.read<FavCubit>(),
                builder: (context, state) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      context.read<FavCubit>().addAndRemoveFavEvent(
                        BookmarkEntities(
                          authors: author,
                          coverI: coverI,
                          description: description,
                          title: title,
                          fav: !status!,
                          key: workKey,
                        ),
                      );
                      status = !status!;
                      context.read<BookmarkBloc>().add(GetBookmarkEvent());
                    },
                    label: Text(
                      status! ? "Remove from Bookmark" : "Save to Bookmark",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      fixedSize: Size(350, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    iconAlignment: IconAlignment.end,
                    icon: Icon(
                      status! ? Icons.bookmark : Icons.bookmark_border_outlined,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
