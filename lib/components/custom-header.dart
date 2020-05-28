import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      padding: const EdgeInsets.only(left: 40),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Acesse sua conta agora!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  'Clique aqui',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
