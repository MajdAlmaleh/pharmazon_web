import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatefulButton extends StatefulWidget {
  final String label;
  String finalState;
  final String toState;
  final Function? onPressed;
  final List<String> disableOnStates;

  StatefulButton({
    required this.label,
    required this.finalState,
    required this.toState,
    required this.onPressed,
    super.key,
    required this.disableOnStates,
  });

  @override
  State<StatefulButton> createState() => _StatefulButtonState();
}

class _StatefulButtonState extends State<StatefulButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: widget.disableOnStates.contains(widget.finalState) &&
                widget.onPressed != null
            ? null
            : () {
                setState(() {
                  widget.finalState = widget.toState;
                });
                widget.onPressed!();
              },
        child: Text(widget.label),
      ),
    );
  }
}
