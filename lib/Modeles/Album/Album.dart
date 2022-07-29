import 'package:freezed_annotation/freezed_annotation.dart';
part 'Album.freezed.dart';
part 'Album.g.dart';

@freezed
class Album with _$Album {
  const factory Album({
    required int userId,
    required int id,
    required String title,
  }) = _Album;

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
}
