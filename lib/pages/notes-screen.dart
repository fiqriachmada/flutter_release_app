import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({super.key});

  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  final TextEditingController _note = TextEditingController();

  Future<void> _add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('note', _note.text);
    });
  }

  Future<void> _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _note.text = (prefs.getString('note') ?? '');
    });
  }

  @override
  void initState() {
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                maxLines: 27,
                controller: _note,
                decoration: const InputDecoration(
                  hintText: 'Catatan Rahasiaku',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: ElevatedButton(
                onPressed: () {
                  _add();
                  const snackBar = SnackBar(
                    content: Text('Notes Saved Successfully.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Simpan'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tutup Catatan Rahasia'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
