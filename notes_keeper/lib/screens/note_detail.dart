import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
    NoteDetail(this.appBarTitle, {super.key});

String appBarTitle = "";
  @override
  State<StatefulWidget> createState() {
    return _NoteDetailState(appBarTitle);
  }
}

class _NoteDetailState extends State<NoteDetail> {
   _NoteDetailState(this.appBarTitle);
static var _priorities = ['High', 'Low'];
String appBarTitle;

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) => moveToLastScreen,
    child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
          moveToLastScreen();
        }, 
        icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem)
                  );
                }).toList(), 
                style: textStyle,
                value: 'Low',
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint('User selected $valueSelectedByUser');
                  });
                }),
            ),
            // Title field
            Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: TextField(
            controller: titleController,
            style: textStyle,
            decoration: InputDecoration(
              labelText : 'Title',
              labelStyle: textStyle,
              border: OutlineInputBorder( borderRadius: BorderRadius.circular(5.0))
            ),
            onChanged: (value) {
              debugPrint('Something changed in title text field');
            }, 
          ),
          ),
          // description Field
           Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: TextField(
            controller: descriptionController,
            style: textStyle,
            decoration: InputDecoration(
              labelText : 'Description',
              labelStyle: textStyle,
              border: OutlineInputBorder( borderRadius: BorderRadius.circular(5.0))
            ),
            onChanged: (value) {
              debugPrint('Something changed in description text field');
            }, 
          ),
          ),

          Padding(padding: const EdgeInsets.only(top: 15, bottom: 15),
          child:  Row(
            children: <Widget>[ 
              Expanded(
                child: ElevatedButton(onPressed: () {
                  setState(() {
                    debugPrint('Save button Clicked');
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple
                ),
                child: const Text('Save', style: TextStyle(color: Colors.white),)
                )
              
              ),
              SizedBox(height: 15),
              Expanded(
                child: ElevatedButton(onPressed: () {
                  setState(() {
                    debugPrint('Delete button Clicked');
                  });
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple
                ),
                child: const Text('Delete',
                 style: TextStyle(
                  color: Colors.white),),),
              
              )
            ],
          ),
          )

          ],
        ),
      ),
    ),);
  }
  
  void moveToLastScreen() {
    Navigator.pop(context);
  }
}