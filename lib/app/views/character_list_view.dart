import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_pedia/app/models/character_model.dart';
import 'package:marvel_pedia/app/repositories/character_repository.dart';
import 'package:marvel_pedia/app/stores/character_store.dart';
import 'package:marvel_pedia/app/views/character_details_view.dart';
import 'package:marvel_pedia/shared/widgets/custom_pagination.dart';
import 'package:marvel_pedia/shared/widgets/text/title_text.dart';
import 'package:provider/provider.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({Key? key}) : super(key: key);

  @override
  _CharacterListViewState createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {


  @override
  Widget build(BuildContext context) {

    var _store = Provider.of<CharacterStore>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        title: const PROTitleText(
          text: 'MarvelPedia',
          color: Colors.white,
          sizeH: 1,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: PROTitleText(
              text: 'Personagens',
              color: Theme.of(context).colorScheme.secondary,
              sizeH: 2,
            ),
          ),

          PagewiseListView<Character>(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            pageSize: 20,
            cacheExtent: 1000,
            itemBuilder: (BuildContext context, Character character, _) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(builder: (context) => CharacterDetailsView(character: character))
                      );
                    },
                    contentPadding: const EdgeInsets.all(0),
                    leading: SizedBox(
                      height: 80,
                      width: 80,
                      child: Hero(
                        tag: {character.id.toString()},
                        child: Image(
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                          image: character.thumbnail['path'] != null ? NetworkImage(character.thumbnail['path'].toString() + '.jpg') : const NetworkImage('https://wp-content.bluebus.com.br/wp-content/uploads/2017/03/31142426/twitter-novo-avatar-padrao-2017-bluebus-660x440.png'),
                        ),
                      ),
                    ),
                    title: Text(character.name.toString(), style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),),
                  ),
                ),
              );
            },
            pageFuture: (pageIndex) =>
                _store.fetchList(offset: pageIndex! * 20),
          )


          // PaginationView<Character>(
          //   paginationViewType: PaginationViewType.listView,
          //   shrinkWrap: true,
          //   itemBuilder: (BuildContext context, Character character, int index) {
          //     return ListTile(
          //       title: Text(character.name.toString()),
          //     );
          //   },
          //   pullToRefresh: false,
          //   pageFetch: _store.fetchList,
          //   onError: (dynamic error) => const Center(
          //     child: Text('Algo deu errado. Tente novamente.'),
          //   ),
          //   onEmpty: const Center(
          //     child: Text('Sem dados'),
          //   ),
          // )



          // FutureBuilder(
          //   future: _store.fetchList(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if(snapshot.connectionState == ConnectionState.done) {
          //       log('Snapshot data: ' + snapshot.data.toString());
          //       return PROPaginationList<Character>(
          //           separatorWidget: Container(
          //             height: 0.5,
          //             color: Colors.black,
          //           ),
          //           itemBuilder: (BuildContext context, Character character) {
          //             return ListTile(
          //               title: Text(character.name.toString()),
          //             );
          //           },
          //           pageFetch: (int page) => _store.fetchList(offset: page),
          //           onError: (dynamic error) => const Center(
          //             child: Text('Algo deu errado. Tente novamente.'),
          //           ),
          //           onEmpty: const Center(
          //             child: Text('Sem dados'),
          //           ),
          //     );
          //
          //       // return ListView.builder(
          //       //   itemCount: snapshot.data.length,
          //       //   shrinkWrap: true,
          //       //   physics: NeverScrollableScrollPhysics(),
          //       //   itemBuilder: (BuildContext context, int index) {
          //       //     return ListTile(
          //       //       title: Text(snapshot.data[index].name.toString()),
          //       //     );
          //       //   },
          //       // );
          //     } else if (snapshot.connectionState == ConnectionState.waiting){
          //       return const Center(child: CircularProgressIndicator(),);
          //     } else {
          //       return const Center(child: Text('Sem dados registrados'),);
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
