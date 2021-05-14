import 'package:flutter/material.dart';

import 'custom_text_fields.dart';


class SingleSetListTile extends StatefulWidget {
  const SingleSetListTile({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  _SingleSetListTileState createState() => _SingleSetListTileState();
}

class _SingleSetListTileState extends State<SingleSetListTile> {
  Color _bgColor = Colors.grey[700];
  bool _setState = false;

  void finishSet(){
    setState(() {
      _setState = _setState ? false : true;
      _bgColor = _setState ? Colors.green : Colors.grey[700];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      
      color: _bgColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Text('${widget.index}', style: TextStyle(fontSize: 20),)
            ),
            Flexible(
              flex: 4,
              child: CustomTextFieldBrighterBg(fontSize: 16,)
            ),
            Flexible(
              flex: 4,
              child: CustomTextFieldBrighterBg(fontSize: 16,)
            ),
            Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.check), 
                onPressed: () => finishSet()
              ),
            )
          ],
        ),
      )
    );
  }
}