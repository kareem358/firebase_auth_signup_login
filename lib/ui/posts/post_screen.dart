import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_csplash_login/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'add_posts.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Post Screen",style: TextStyle(
          fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold,)),
        centerTitle: true,
        actions: [

            IconButton(

              onPressed: () {
                auth.signOut().then((value){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen(),));
                }).onError((error,stackTrace){
                  Utils.showErrorToast(error.toString());
                });
                },
               icon: Icon(Icons.logout, color: Colors.white,),
               ),





        ],
      ) ,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPostScreen()),
            );
          },
          label: Text(
            "Add Post",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          icon: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.deepPurple,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      body: Center(
        child: Text("Post Screen",style: TextStyle(fontSize: 22),),
      )
    );
  }
}
