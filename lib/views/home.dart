import 'package:crudpractice/controller/userController.dart';
import 'package:crudpractice/views/user.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserView()),
              );
            },
            child: const Icon(Icons.add)),
        body: FutureBuilder(
          future: getUsers(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data.data[index].name),
                    subtitle: Text(snapshot.data.data[index].email),
                    trailing: IconButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => updateUser(
                                      id: snapshot.data.users[index].id,
                                      name: snapshot.data.users[index].name,
                                      userName:
                                          snapshot.data.users[index].username,
                                      email:
                                          snapshot.data.users[index].email)));
                          print("Hello World");
                          setState(() {});
                        },
                        icon: Icon(Icons.edit)),
                    iconColor: Colors.orange,
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
