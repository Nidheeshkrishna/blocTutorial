part of 'album_freezed_bloc_bloc.dart';

@freezed
class AlbumFreezedBlocEvent with _$AlbumFreezedBlocEvent {
  const factory AlbumFreezedBlocEvent.started() = _Started;
  const factory AlbumFreezedBlocEvent.DataLoading() = _DataLoading;
  const factory AlbumFreezedBlocEvent.DataLoaded() = _DataLoaded;
  const factory AlbumFreezedBlocEvent.DataLoadedError(String Error) =
      _DataLoadedError;
}
