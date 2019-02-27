import 'package:flutter/material.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/spinner-dialog.dart';

class ListViewProvince extends StatefulWidget {
  @override
  _ListViewProvinceState createState() => _ListViewProvinceState();
}

class _ListViewProvinceState extends State<ListViewProvince> {
  List _provinces = [
    'Phnom Penh', 'Banteay Meanchey',
    'Battambang', 'Kompong Cham',
    'Kampong Chhnang', 'Kampong Speu',
    'Kampong Thom', 'Kampot', 'Kandal',
    'Koh Kong', 'Kep', 'Kratie', 'Mondulkiri',
    'Oddar Meanchey', 'Pailin', 'Sihanoukville',
    'Preah Vihear', 'Pursat', 'Prey Veng',
    'Ratanakiri', 'Siem Reap', 'Stung Treng',
    'Svay Rieng', 'Takeo', 'Tbong Khmum'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.listProvince,
      layout: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildCard(String name){
    return Card(
      child: ListTile(
        title: Text(name),
        onTap: (){
          Navigator.pop(context, name);
        },
      ),
    );
  }

  Widget _buildForm() {
    return ListView(
      children: _provinces.map((province) =>
          _buildCard(province)
      ).toList(),
    );
  }
}