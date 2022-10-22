import 'package:citycafe_app/Componant/showModal.dart';
import 'package:citycafe_app/service/Firestore.dart';
import 'package:citycafe_app/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController usertext = TextEditingController();
  TextEditingController idtext = TextEditingController();
  TextEditingController courstext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                color: Colors.blueGrey,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        child: Image.network(FirebaseAuth
                                .instance.currentUser!.photoURL ??
                            "https://mpchsschool.in/wp-content/uploads/2019/10/default-profile-picture.png"),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      radius: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser!.displayName ??
                                "name",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            FirebaseAuth.instance.currentUser!.email ?? "email",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.orange.shade600,
          actions: [
            TextButton(
                onPressed: () {
                  AuthService().signOut(context);
                  // AuthService().signout();
                },
                child: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange.shade600,
          onPressed: () async {
            QuerySnapshot snap = await AuthService().getUserData();

            if (snap.docs[0]["admin"]) {
              Show().showAddUser(context, usertext, idtext, courstext,
                  Colors.white, Colors.grey);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("you mast be admin to do that ")));
            }
          },
          child: Icon(Icons.add),
        ),
        body: StreamBuilder(
            stream: getStream(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              else
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return listUser(snapshot.data!.docs[index], context);
                  },
                );
            }));
  }

  Widget listUser(DocumentSnapshot data, context) {
    return ListTile(
      title: Text("${data["name"]}"),
      subtitle: Row(
        children: [
          Text("id : ${data["id"]}"),
          SizedBox(
            width: 10,
          ),
          Text("Cours : ${data["cours"]}"),
        ],
      ),
      trailing: TextButton(
        onPressed: () async {
          QuerySnapshot snap = await AuthService().getUserData();

          if (snap.docs[0]["admin"]) {
            Show().showEditUser(data.id, context, usertext, idtext, courstext,
                Colors.white, Colors.grey);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("you mast be admin to do that ")));
          }
        },
        child: Icon(
          Icons.edit_sharp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
