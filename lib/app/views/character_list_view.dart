import 'package:flutter/material.dart';
import 'package:marvel_pedia/shared/widgets/inputs/text_input.dart';
import 'package:marvel_pedia/shared/widgets/text/title_text.dart';

class CharacterListView extends StatefulWidget {
  const CharacterListView({Key? key}) : super(key: key);

  @override
  _CharacterListViewState createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  @override
  Widget build(BuildContext context) {
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container();
          }, childCount: 10))
        ],
      ),
    );
  }
}
