import 'dart:async';

import 'package:book_app/core/failure/server_failure.dart';
import 'package:book_app/features/bookshelf/domain/entities/feature_book_entities.dart';
import 'package:book_app/features/bookshelf/domain/usecases/romance_book_get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'romance_event.dart';
part 'romance_state.dart';

class RomanceBloc extends Bloc<RomanceEvent, RomanceState> {
  final RomanceBookGet _romanceBookGet;

  RomanceBloc(this._romanceBookGet) : super(RomanceInitial()) {
    on<GetRomanceBookEvent>(getRomanceBookEvent);
  }

  FutureOr<void> getRomanceBookEvent(
    GetRomanceBookEvent event,
    Emitter<RomanceState> emit,
  ) async {
    emit(LoadingGetRomanceBookState());
    final response = await _romanceBookGet.call();

    response.fold(
      (failure) {
        emit(ErrorGetRomanceBookState(failure));
      },
      (response) {
        emit(SuccessGetRomanceBookState(response));
      },
    );
  }
}
