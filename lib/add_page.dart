
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){_addCountry(context);},
        child: Text("save"),
      ),

      appBar: AppBar(
        title: Text('Add Country'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              maxLines: null,
              decoration:InputDecoration(labelText: 'Country Name',
                  border:InputBorder.none
              ),

            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
  void _addCountry(BuildContext context) {
    final String name = _controller.text.trim();
    if (name.isNotEmpty) {
      FirebaseFirestore.instance.collection("countries").add({"name": name});
      Navigator.pop(context);
    } else {
      // Show an error message or handle the case where the input is empty.
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
