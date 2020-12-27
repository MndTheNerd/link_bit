import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_bit/models/link_data.dart';
import '../components/footer.dart';
import '../components/button_link.dart';
import 'package:link_bit/constants.dart';

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //using streamBuilder to connect to firebase
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('links').snapshots(),
      builder: (context, snapshot) {
        //using a progress indicator while the data loads
        if(snapshot.connectionState == ConnectionState.waiting){
           return Center(child: CircularProgressIndicator(),);
        }
        //grabbing the data from firebase and convert it according to the data type used
        final _documents = snapshot.data.docs.map((doc) {
          return LinkData.fromMap(doc.data()) ;
        }).toList();
        return Material(
          child: Column(
            children: [
              SizedBox(height: 35),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(imageURL),
                radius: 42,
              ),
              SizedBox(height: 12),
              Text(
                '@MndTheNerd',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                'Developer, Content Creator and a Gamer',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 20),
              //go through a document map and add button for each one
              for (var document in _documents)
                ButtonLink(
                  title: document.title,
                  urlString: document.url,
                ),
              Spacer(),
              Footer()
            ],
          ),
        );
      }
    );
  }
}
