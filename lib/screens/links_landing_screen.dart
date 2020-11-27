import 'package:flutter/material.dart';
import '../components/footer.dart';
import '../components/button_link.dart';
import 'package:link_bit/constants.dart';

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(height: 35),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(imageURL),
            radius: 48,
          ),
          SizedBox(height: 12),
          Text(
            '@MndTheNerd',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Developer, Content Creator and a Gamer',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 20),
          for (var document in documents)
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
}
