import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()?onTap;
  const UserTile({super.key,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(children: [
          //icon
          Icon(Icons.person),
          //name
          Text(text),
        ]),
      ),

    );
  }
}