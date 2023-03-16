import 'package:felicitytest/data/models/MovieModel.dart';
import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  CardMovie({Key? key, required this.height, 
  this.pressDelete,
  this.pressUpdate,
  
  required this.width, this.movie})
      : super(key: key);

  final double height;
  final double width;
  MovieModel? movie;
   Function()? pressDelete;
   Function()? pressUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Card(
              child: Container(
                height: height * 110,
                width: width * 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/images4.jpeg'))
                        ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie!.ref!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      movie!.nom!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      movie!.commentaire!,
                    ),
                    Text("Note: ${movie!.note!}"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: pressUpdate,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed:pressDelete,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider()
      ],
    );
  }
}
