
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailPage extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> document;
  const DetailPage({Key? key, required this.document}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.document['name']);
    super.initState();
  }
void _update(){
    widget.document.reference.update({'name':_controller.text});
    Navigator.pop(context);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("edit"),),
      body: TextField(
          controller: _controller,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none
        ),
        ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _update();

      },
      child:Text("save") ,),

    );

  }
}
//   void _updateDocument() {
//     widget.document.reference.update({'name': _controller.text});
//     Navigator.pop(context);
















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class DetailPage extends StatefulWidget {
//   final QueryDocumentSnapshot<Object?> document;
//
//   const DetailPage({Key? key, required this.document}) : super(key: key);
//
//   @override
//   _DetailPageState createState() => _DetailPageState();
// }
//
// class _DetailPageState extends State<DetailPage> {
//   late TextEditingController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController(text: widget.document['name']);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Country'),
//
//
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height / 4, // Adjust the height as needed
//               child: TextField(
//                 controller: _controller,
//                 maxLines: null, // Allow unlimited number of lines
//                 keyboardType: TextInputType.multiline, // Allow multiline input
//                 decoration: InputDecoration(labelText: 'Country Name'),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _updateDocument();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   void _updateDocument() {
//     widget.document.reference.update({'name': _controller.text});
//     Navigator.pop(context);
//   }
// }