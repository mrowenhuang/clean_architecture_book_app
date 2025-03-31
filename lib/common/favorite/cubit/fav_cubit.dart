import 'package:book_app/features/bookshelf/domain/entities/bookmark_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/bookmark_add_and_remove.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  final BookmarkAddAndRemove _bookmarkAddAndRemove;

  FavCubit(this._bookmarkAddAndRemove) : super(FavInitial());

  Future<void> addAndRemoveFavEvent(BookmarkEntities data) async {
    emit(LoadingAddFavState());

    print(data.fav);

    final response = await _bookmarkAddAndRemove.call(data);
    response.fold(
      (failure) {
        emit(ErrorAddFavState(failure: failure.message));
      },
      (response) {
        emit(SuccessAddFavState(message: response));
      },
    );
  }
}
