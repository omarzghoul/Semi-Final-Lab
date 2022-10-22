import 'package:citycafe_app/service/Firestore.dart';
import 'package:citycafe_app/service/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Show {
  AuthService _auth = AuthService();
  FirebaseFirestore instance = FirebaseFirestore.instance;
  void showAddUser(context, userController, idController, coursController,
          Containercolor, Buttoncolor) =>
      showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
          context: context,
          isScrollControlled: true,
          backgroundColor: Containercolor,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    autofocus: true,
                    controller: userController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a name',
                    ),
                  ),
                  TextField(
                    autofocus: true,
                    controller: idController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a id',
                    ),
                  ),
                  TextField(
                    autofocus: true,
                    controller: coursController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a cours',
                    ),
                  ),
                  Container(
                    color: Buttoncolor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            userController.text = "";
                            idController.text = "";
                            coursController.text = "";

                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () async {
                            create(userController.text, idController.text,
                                coursController.text);
                            userController.text = "";
                            idController.text = "";
                            coursController.text = "";

                            Navigator.pop(context);
                          },
                          child: Text("Save",
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          });

  void showEditUser(String id, context, userController, idController,
      coursController, Containercolor, Buttoncolor) {
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        context: context,
        isScrollControlled: true,
        backgroundColor: Containercolor,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  autofocus: true,
                  controller: userController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a name',
                  ),
                ),
                TextField(
                  autofocus: true,
                  controller: idController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a id',
                  ),
                ),
                TextField(
                  autofocus: true,
                  controller: coursController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a cours',
                  ),
                ),
                Container(
                  color: Buttoncolor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          delete(id);
                          userController.text = "";
                          idController.text = "";
                          coursController.text = "";
                          Navigator.pop(context);
                        },
                        child: Text("Delete",
                            style: TextStyle(color: Colors.white)),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              userController.text = "";
                              idController.text = "";
                              coursController.text = "";
                              Navigator.pop(context);
                            },
                            child: Text("Cancel",
                                style: TextStyle(color: Colors.white)),
                          ),
                          TextButton(
                            onPressed: () {
                              update(id, userController.text, idController.text,
                                  coursController.text);
                              userController.text = "";
                              idController.text = "";
                              coursController.text = "";

                              Navigator.pop(context);
                            },
                            child: Text("Save",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
