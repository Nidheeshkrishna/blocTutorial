import 'package:freezed_annotation/freezed_annotation.dart';
part 'demomodel.freezed.dart';

part 'demomodel.g.dart';

@freezed
class DemoAlbum with _$DemoAlbum {
  const factory DemoAlbum({
    required int userId,
    required int id,
    required String title,
  }) = _DemoAlbum;

  factory DemoAlbum.fromJson(Map<String, dynamic> json) =>
      _$DemoAlbumFromJson(json);
}
