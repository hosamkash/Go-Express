import 'package:flutter/material.dart';

class ctr_FloatingActionButton extends StatefulWidget {
  const ctr_FloatingActionButton(this.onPressed , {super.key});

 final void Function()? onPressed;
  @override
  State<ctr_FloatingActionButton> createState() => _ctr_FloatingActionButtonState();
}

class _ctr_FloatingActionButtonState extends State<ctr_FloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      child: const Icon(
        Icons.add,
        size: 40,
      ),
      onPressed: widget.onPressed,
    );
  }
}
