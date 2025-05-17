
import 'package:flutter/material.dart';
//import "package:font_awesome_flutter/font_awesome_flutter.dart";

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
          backgroundColor: Colors.pink.shade200,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'asets/Images/Couple3.jpg', // Placeholder for the icon/logo
                        height: 80,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Each Other",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Meet Our Team",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade300,
                  ),
                ),
                Card(
                  elevation: 2,
                  color: Colors.pink[50],
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow("Developed by", "Pushti Markana  (23010101160)"),
                        _buildInfoRow("Mentored by", "Prof. Mehul Bhundiya\n(Computer Engineering Department)"),
                        _buildInfoRow("Explored by", "ASWDC, School of Computer Science"),
                        _buildInfoRow("Eulogized by", "Darshan University, Rajkot, Gujarat, INDIA"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "About ASWDC",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade300,
                  ),
                ),
                Card(
                  elevation: 2,
                  color: Colors.pink[50],
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "ASWDC is the Application, Software, and Website Development Center @ Darshan University, run by Students and Staff of the School Of Computer Science.\n\n" +
                          "Sole purpose of ASWDC is to bridge the gap between university curriculum and industry demands. Students learn cutting-edge technologies, develop real-world applications, and experience a professional environment under the guidance of industry experts and faculty members.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade300,
                  ),
                ),
                Card(
                  elevation: 2,
                  color: Colors.pink[50],
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        _buildContactRow(Icons.email, "aswdc@darshan.ac.in"),
                        _buildContactRow(Icons.phone, "+91-9727747317"),
                        _buildContactRow(Icons.web, "www.darshan.ac.in"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(Icons.share, "Share App"),
                    _buildActionButton(Icons.apps, "More Apps"),
                    _buildActionButton(Icons.star, "Rate Us"),
                    _buildActionButton(Icons.thumb_up, "Like"),
                    _buildActionButton(Icons.update, "Check Update"),
                  ],
                ),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    "© 2025 Darshan University\nAll Rights Reserved - Made with ❤ in India",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label : ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink.shade300, size: 20),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.pink.shade300, size: 24),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }
}

