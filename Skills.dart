import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skills"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSkillTile(
                  Icons.code, "Programming Languages: C, C++,Python,Dart"),
              _buildSkillTile(Icons.language, "Bangla and English"),
              _buildSkillTile(Icons.text_snippet,
                  "Soft skills: Communication,Teamwork,Time Management,"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.teal,
      ),
      title: Text(text, style: TextStyle(fontSize: 18, color: Colors.black)),
    );
  }
}
