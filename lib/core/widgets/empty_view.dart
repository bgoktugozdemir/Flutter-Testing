import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView(this.icon, {Key? key}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 64,
    );
  }
}
