import 'package:flutter/material.dart';

class makeButton extends StatefulWidget {
  const makeButton({super.key,required this.text, required void Function() onTap});
final String text;

  @override
  State<makeButton> createState() => _makeButtonState();
}

class _makeButtonState extends State<makeButton> {
late final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal:25),
        child: Center(
          child: Text(widget.text),
        ),
      ),
    );
  }
}
