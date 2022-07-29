part of 'album_freezed_bloc_bloc.dart';

@freezed
class AlbumFreezedBlocState with _$AlbumFreezedBlocState {
  const factory AlbumFreezedBlocState.initial() = _Initial;
  const factory AlbumFreezedBlocState.AlbumLoading() = _AlbumLoading;
  const factory AlbumFreezedBlocState.AlbumsLoaded(List<Album>? albums) =
      _AlbumsLoaded;
  const factory AlbumFreezedBlocState.AlbumsListError(String error) =
      _AlbumsListError;
}
