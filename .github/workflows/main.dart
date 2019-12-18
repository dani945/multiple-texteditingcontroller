import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: ListData(),
  ));
}

class ListData extends StatefulWidget {
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
//   final themeData = Theme.of(context);
//     final textTheme = themeData.textTheme;
//     final themeBody = textTheme.body1.copyWith(fontSize: 16);
  List<dynamic> data = ['satu','dua','tiga'];
//   var data = {0: "Tom", 1: 'tom@xyz.com'}; 
    final _keteranganControll = <TextEditingController>[];
  List hasil = new List();

  
  @override
  Widget build(BuildContext context) { 
    
    
    final children = <Widget>[
      Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 4),
        alignment: Alignment.bottomLeft,
        child: Text('BANTUAN PENGOBATAN'),
      ),
      Divider(height: 0),
      
      SizedBox(height: 32),
    ];    
    
//     final index = data.asMap();
//     var idx = index.keys.toList();
//     idx.forEach((g){
//       print(g);
//     });
  var index = 0;
    List tes = new List();
  data.forEach((f){
    var idx = index++;
    tes.add(idx);
    _keteranganControll.add(new TextEditingController());
    children.add(Material(
      color: Colors.red,
      child: ListTile(
        title: Text(
          'Keterangan index ke-${idx}',
          style: TextStyle(color: Colors.black)
        ),
        subtitle: new TextField(
          controller: _keteranganControll[idx],
          decoration: InputDecoration(
          labelText: 'Keterangan'
        ),
        onChanged: (val){
          // _ketCont.text = val;
          
          // _ket.add(_keteranganControll[t.index].text);
          setState(() {
            
          });
        },
      ),
      ),
    )
  );
    
  });
    tes.map((k){
      setState(() {
              print(_keteranganControll[k].text);
            });
          
    }).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('tes'),
      ),
      body: ListView(
        children: children,
      ),
      bottomNavigationBar:
      Row(
      children: <Widget>[
        RaisedButton(
      onPressed: (){
        print(hasil);
      },
        child: Text('Tekan'),
      ),
      ],
      )
      
    );  
    
  }
}
