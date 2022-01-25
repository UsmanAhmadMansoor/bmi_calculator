import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({ Key? key ,
  required this.content,
  required this.onPress,}) : super(key: key);

  final void Function() onPress;
  final String content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onPress,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(child: Text(content,style: TextStyle(fontSize: 25),)),
            ),
          );
  }
}
