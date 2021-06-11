import 'package:flutter/material.dart';

class ColorBlock extends StatelessWidget {
  ColorBlock(
      {Key? key,
      required this.title,
      required this.index,
      required this.destination,
      required this.timeUntil})
      : super(key: key);

  final String title;
  final int index;
  final String destination;
  final int timeUntil;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: new InkWell(
                onTap: () {
                  print(index);
                  Navigator.of(context)
                      .pushNamed('/detail', arguments: {'id': index});
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.cyan[300],
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              destination,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: RichText(
                                textAlign: TextAlign.right,
                                text: TextSpan(
                                    text: '$timeUntil',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: 'mins',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black))
                                    ]),
                              ))
                        ])))));
  }
}
