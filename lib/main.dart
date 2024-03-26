import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Nama',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> names = [];
  List<String> email = [];

  void addName(String newName) {
    setState(() {
      names.add(newName);
    });
  }

  void addEmail(String newEmail) {
    setState(() {
      email.add(newEmail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAFTAR NAMA MAHASISWA PRADITA UNIVERSITY'),
        backgroundColor: Color.fromARGB(255, 255, 116, 255),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4.0, //Memberikan efek shadow
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/black_suit.png'),
                  radius: 30.0,
                ),
                title: Text(
                  names[index],
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      names.removeAt(index);
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),

      //Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newName = '';
              String newEmail = '';
              String newPhone = '';
              return AlertDialog(
                title: const Text('Add New Name'),
                content: TextField(
                  onChanged: (value) {
                    newName = value;
                    newEmail = value;
                    newPhone = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter a name',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (newName.isNotEmpty) {
                        addName(newName);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      //End
    );
  }
}
