import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: ListData(),
  ));
}

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  final data = <String>['satu', 'dua', 'tiga'];
  final controllers = <TextEditingController>[];
  final children = <Widget>[];

  @override
  void initState() {
    super.initState();
    
    for (int i=0; i<data.length; i++) {
      final f = data[i];
      final controller = TextEditingController(text: f);
      controllers.add(controller);
      children.add(Material(
        child: ListTile(
          title: Text(
            'Description index-$i',
          ),
          subtitle: new TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Description'),
            onChanged: (val) {
              data[i] = val;
            },
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final childrenListView = <Widget>[
      Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 32,
          bottom: 4,
        ),
        alignment: Alignment.bottomLeft,
        child: Text('TREATMENT'),
      ),
      Divider(height: 0),
      SizedBox(height: 32),
    ];
    
    if (children.isNotEmpty) {
      childrenListView.addAll(children);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple TextEditingController'),
      ),
      body: ListView(
        children: childrenListView,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                print(data.join(', '));
              },
              child: Text('Print Output'),
            ),
          ],
        ),
      ),
    );
  }
}
