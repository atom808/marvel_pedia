import 'package:flutter/material.dart';
import 'package:marvel_pedia/app/stores/character_store.dart';
import 'package:marvel_pedia/shared/widgets/text/title_text.dart';
import 'package:provider/provider.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({Key? key}) : super(key: key);

  @override
  _CharacterListViewState createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var _store = Provider.of<CharacterStore>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 60,
            expandedHeight: 140,
            elevation: 24,
            floating: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            iconTheme: const IconThemeData(color: Colors.white,),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
            ),
            snap: true,
            pinned: true,
            stretch: true,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Theme.of(context).colorScheme.primary,
                        Colors.red.shade900
                      ]),
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              ),
              titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              centerTitle: false,
              title: const PROTitleText(
                text: 'MarvelPedia',
                color: Colors.white,
                sizeH: 1,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: FutureBuilder(
              future: _store.fetchList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(snapshot.data[index]!.toString()),
                      );
                    },
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                } else {
                  return const Center(child: Text('Sem dados registrados'),);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
