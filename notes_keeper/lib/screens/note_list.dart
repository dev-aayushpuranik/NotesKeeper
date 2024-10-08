import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NoteListState();
  }
}

class _NoteListState extends State<NoteList> {
  
int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: getNotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

      },
      shape: const CircleBorder(
        eccentricity: BorderSide.strokeAlignOutside
      ),
      tooltip: 'Add Note',
      child: const Icon(Icons.add),
      ),
    );
  }

  ListView getNotesListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),

            title: Text('Dummy Title', style: textStyle),

            subtitle: Text('Dummy Date'),

            trailing: Icon(Icons.delete, color: Colors.grey,),

            onTap: () {
              debugPrint("this is debug print");
            },
            ),
        );
      }, 
    );
  }
  }