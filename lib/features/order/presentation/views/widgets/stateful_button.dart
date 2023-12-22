import 'package:flutter/material.dart';
import 'package:pharmazon_web/features/order/presentation/views/widgets/order_details_view_body.dart';

class StatefulButton extends StatefulWidget {
  final String label;
  String finalState;
  final String toState;
  final Function onPressed;
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
        onPressed: widget.disableOnStates.contains(widget.finalState)
            ? null
            : () {
                setState(() {
                  widget.finalState = widget.toState;
                });
                widget.onPressed();
              },
        child: Text(widget.label),
      ),
    );
  }
}
