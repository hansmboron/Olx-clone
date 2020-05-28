import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  const IconTile({this.label, this.iconData, this.onTap, this.highlighted});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
          color: highlighted ? Theme.of(context).primaryColor : Colors.black87,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Theme.of(context).primaryColor : Colors.black87,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    );
  }
}
