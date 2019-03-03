import 'package:flutter/material.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/spinner-dialog.dart';

class ListViewAgent extends StatefulWidget {
  @override
  _ListViewAgentState createState() => _ListViewAgentState();
}

class _ListViewAgentState extends State<ListViewAgent> {
  List _agents = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getAgents();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.listAgent,
      layout: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildCard(String id, String name){
    return Card(
      child: ListTile(
        title: Text(id),
        subtitle: Text(name),
        onTap: (){
          Navigator.pop(context,
              _agents.firstWhere((agent)=> agent.agentNo == id, orElse: ()=> null)
          );
        },
      ),
    );
  }

  void _getAgents(){
    NetworkService.getAgent().then((agentsDB){
      _agents = agentsDB;
      _isLoading = false;
      _onSetState();
    }).catchError((err){
      _isLoading = false;
      _onSetState();
    });
  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }

  Widget _buildForm() {
    if(_isLoading){
      return SpinnerDialog.onLoading(context);
    }

    return ListView(
      children: _agents.map((agent) =>
          _buildCard(agent.agentNo, agent.agentNameEn)
      ).toList(),
    );
  }
}