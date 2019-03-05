import 'package:flutter/material.dart';
import 'package:sm_app/model_dao/teamInfoDAO.dart';
import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/team-info/team-info.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/spinner-dialog.dart';

class ListViewAgent extends StatefulWidget {
  final String teamNo;

  ListViewAgent({this.teamNo});

  @override
  _ListViewAgentState createState() => _ListViewAgentState();
}

class _ListViewAgentState extends State<ListViewAgent> {
  List<TeamInfoDAO> _teamInfos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getTeamInfo();
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
              _teamInfos.firstWhere(
                      (teamInfo)=> teamInfo.agent.agentNo == id, orElse: ()=> null)
          );
        },
      ),
    );
  }

  void _getTeamInfo(){
    NetworkService.getTeamInfo(widget.teamNo).then((teamInfosDB){
      _teamInfos = teamInfosDB;
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
      children: _teamInfos.map((teamInfo) =>
          _buildCard(teamInfo.agent.agentNo, teamInfo.agent.agentNameEn)
      ).toList(),
    );
  }
}
