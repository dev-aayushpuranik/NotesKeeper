import 'package:flutter/material.dart';
import 'package:notes_keeper/screens/note_detail.dart';

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
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.deepPurple,

      ),
      body: getNotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToNoteDetails("Add Note");
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
              navigateToNoteDetails("Edit Note");
            },
            ),
        );
      }, 
    );
  }

  void navigateToNoteDetails(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(title);
    }));
  }
  }