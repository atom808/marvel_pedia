import 'package:flutter/material.dart';
import 'package:marvel_pedia/app/models/character_model.dart';
import 'package:marvel_pedia/shared/widgets/text/title_text.dart';

class CharacterDetailsView extends StatefulWidget {
  final Character character;
  const CharacterDetailsView({Key? key, required this.character}) : super(key: key);

  @override
  _CharacterDetailsViewState createState() => _CharacterDetailsViewState();
}

class _CharacterDetailsViewState extends State<CharacterDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0,
        elevation: 2,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        title: Text(widget.character.name),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
            child: SizedBox(
              height: 350,
              width: double.infinity,
              child: Hero(
                tag: {widget.character.id.toString()},
                child: Image(
                  fit: BoxFit.cover,
                  image: widget.character.thumbnail['path'] != null ? NetworkImage(widget.character.thumbnail['path'].toString() + '.jpg') : const NetworkImage('https://wp-content.bluebus.com.br/wp-content/uploads/2017/03/31142426/twitter-novo-avatar-padrao-2017-bluebus-660x440.png'),
                ),
              ),
            ),
          ),
          const Divider(color: Colors.transparent,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: PROTitleText(text: 'Descrição', sizeH: 3, color: Colors.indigo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.indigo,
                )
              ),
              child: Wrap(
                children: [
                  Text(
                    widget.character.description.isNotEmpty ? widget.character.description : 'Sem descrição',
                  ),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.transparent,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: PROTitleText(text: 'Quadrinhos', sizeH: 3, color: Colors.indigo,),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.character.comicsList['items'].length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if(widget.character.comicsList['items'].length > 0) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(index == 0 ? 20 : 4, 0, 4, 0),
                    child: Chip(
                      backgroundColor: Colors.indigo.withOpacity(0.2),
                      label: Text(widget.character.comicsList['items'][index]['name'], style: const TextStyle(color: Colors.indigo),),
                    ),
                  );
                } else {
                  return const Center(child: Text('Sem aparições em Quadrinhos'),);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
