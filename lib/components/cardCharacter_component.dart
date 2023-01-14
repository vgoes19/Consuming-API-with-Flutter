
import 'package:flutter/material.dart';

import '../models/character.dart';

class CardCharacter extends StatelessWidget {
  const CardCharacter({
    Key? key,
    required this.charactersOfPage,
  }) : super(key: key);

  final Character charactersOfPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: SizedBox(
        width: 150,
        height: 165,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(charactersOfPage.image!),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${charactersOfPage.name}',
                      style: const TextStyle(
                        fontSize: 17, 
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Gender: ${charactersOfPage.gender}',
                      style: const TextStyle(
                        fontSize: 17, 
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Species: ${charactersOfPage.species}',
                      style: const TextStyle(
                        fontSize: 17, 
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Status: ${charactersOfPage.status}',
                          style: const TextStyle(
                            fontSize: 17, 
                            color: Colors.white
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.radio_button_checked_sharp,
                          color: verifyStatusCharacter(charactersOfPage.status!),
                        ),
                      ],
                    ), 
                    const SizedBox(height: 5),
                    Text(
                      'Origin: ${charactersOfPage.origin!.name}',
                      style: const TextStyle(
                        fontSize: 17, 
                        color: Colors.white
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

MaterialColor verifyStatusCharacter(String status) {
  MaterialColor colorStatus = Colors.lightGreen;
  switch (status) {
    case "Alive":
      colorStatus = Colors.lightGreen;
      break;
    case "unknown":
      colorStatus = Colors.yellow;
      break;
    case "Dead":
      colorStatus = Colors.red;
      break;
  }

  return colorStatus;
}
