import 'package:flutter/material.dart';
import 'package:flutter_applicationgoogle_drive/Modeles/Album/Album.dart';
import 'package:flutter_applicationgoogle_drive/bloc/bloc/album_freezed_bloc_bloc.dart';
import 'package:flutter_applicationgoogle_drive/utilities/Sizeconfig.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  //
  @override
  void initState() {
    super.initState();
    //-_loadAlbums();
    // -_loadAlbums();
  }

  // _loadAlbums() async {}

  @override
  Widget build(BuildContext context) {
    //context.bloc<AlbumFreezedBlocBloc>().add( const AlbumFreezedBlocEvent.DataLoaded(),
    BlocProvider.of<AlbumFreezedBlocBloc>(context)
        .add(const AlbumFreezedBlocEvent.DataLoaded());
    //AlbumsRepo().fetchAlbum(const AlbumFreezedBlocEvent.DataLoaded(""));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: SizedBox(
        width: SizeConfig.widthMultiplier * 99,
        height: SizeConfig.heightMultiplier * 99,
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumFreezedBlocBloc, AlbumFreezedBlocState>(
            builder: (BuildContext context, state) {
          return state.when(AlbumLoading: () {
            return const CircularProgressIndicator();
          }, AlbumsListError: (String error) {
            return Center(
              child: Container(
                  color: Colors.redAccent,
                  width: 200,
                  height: 100,
                  child: const Icon(Icons.cloud_off)),
            );
          }, AlbumsLoaded: (List<Album>? albums) {
            return Expanded(
              child: ListView.builder(
                itemCount: albums!.length,
                itemBuilder: (_, index) {
                  Album album = albums[index];
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(album.title),
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          }, initial: () {
            return const CircularProgressIndicator();
          });
        }),
      ],
    );
  }
}
