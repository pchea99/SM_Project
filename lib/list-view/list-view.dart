import 'package:flutter/material.dart';

class ListViewAgent extends StatefulWidget {
  @override
  _ListViewAgentState createState() => _ListViewAgentState();
}

class _ListViewAgentState extends State<ListViewAgent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _buildCard(String id, String name){
    return Card(
      child: ListTile(
        leading: Text(id),
        title: Text(name),
      ),
    );
  }
}
