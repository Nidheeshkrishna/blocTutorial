import 'package:bloc/bloc.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/Album/Album.dart';
import 'package:flutter_applicationgoogle_drive/Network/albumRest.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_freezed_bloc_bloc.freezed.dart';
part 'album_freezed_bloc_event.dart';
part 'album_freezed_bloc_state.dart';

class AlbumFreezedBlocBloc
    extends Bloc<AlbumFreezedBlocEvent, AlbumFreezedBlocState> {
  AlbumFreezedBlocBloc() : super(const _Initial()) {
    on<AlbumFreezedBlocEvent>((event, emit) async {
      emit(const _AlbumLoading());
      try {
        if (event is _DataLoaded) {
          try {
            final responce = await AlbumsRepo().fetchAlbum();

            emit(AlbumFreezedBlocState.AlbumsLoaded(responce));
          } catch (e) {
            emit(AlbumFreezedBlocState.AlbumsListError(e.toString()));
          }
        } else if (event is _DataLoading) {
          emit(const AlbumFreezedBlocState.AlbumLoading());
        } else if (event is _DataLoadedError) {
          emit(AlbumFreezedBlocState.AlbumsListError(event.Error));
        }
      } catch (error) {
        emit(AlbumFreezedBlocState.AlbumsListError(error.toString()));
      }
    });
  }
}
