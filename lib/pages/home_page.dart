
import 'package:flutter/material.dart';
import 'package:flutter_api/models/character.dart';
import 'package:flutter_api/services/web_client.dart';

import '../components/cardCharacter_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Character> charactersOfPage = [];
  final _webClient = CharacterService();
  int pageAux = 1;

  @override
  void initState() {
    super.initState();
    findCharactersOfPage(pageAux);
  }

  findCharactersOfPage(int page) async{
    charactersOfPage = await _webClient.findCharactersPage(page).then((value) {
      return charactersOfPage = value.toList();
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Characters Rick and Morty'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/ceu.jpeg"),
            fit: BoxFit.cover,
          ),
          color: Colors.black12
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Flexible(
                child: Center(
                  child: ListView.builder(
                    itemCount: charactersOfPage.length,
                    itemBuilder: (context, index) {
                      return CardCharacter(charactersOfPage: charactersOfPage[index]);
                    }
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  pageAux > 1 ?
                    FloatingActionButton(
                      child: const Icon(Icons.arrow_back, size: 30),
                      backgroundColor: Colors.black,
                      onPressed: () {
                        //back page    
                        setState(() {
                          pageAux --;
                          findCharactersOfPage(pageAux);
                        });                
                      },
                    )
                  : Container(),
                  const SizedBox(width: 25),
                  Text(
                    'Page: $pageAux', 
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25
                    ),
                  ),
                  const SizedBox(width: 25),
                  FloatingActionButton(
                    child: const Icon(Icons.arrow_forward, size: 30),
                    backgroundColor: Colors.black,
                    onPressed: () {
                      //next page  
                      setState(() {
                        pageAux ++;
                        findCharactersOfPage(pageAux);
                      });                 
                    },
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

}
