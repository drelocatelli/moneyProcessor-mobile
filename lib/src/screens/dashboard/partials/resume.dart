import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mp_mobile/src/controllers/Date.dart';
import 'package:mp_mobile/src/screens/dashboard/partials/revExpDetails.dart';
import 'package:mp_mobile/src/services/dto/resume.dart';
import 'package:shimmer/shimmer.dart';

import '../../../services/resume.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  void initState() {
    super.initState();
  }

  Future<IResume?> _loadData() async {
    return await ResumeService.index(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<IResume?>(
          future: _loadData(),
          builder: (context, AsyncSnapshot<IResume?> snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildResume(snapshot.data),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildResumeLoading(),
            );
          },
        ),
      );
  }

  List<Widget> _buildResumeLoading() {
    return [
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildResume(IResume? resume) {
    final startDate = resume?.payload?.startDate?.replaceAll('-', '/').split('/');
    final endDate = resume?.payload?.endDate?.replaceAll('-', '/').split('/');
    
    return [
      SelectableText(
        "Resumo de ${Date.formatDate(startDate)} até ${Date.formatDate(endDate)} \n(${Date.calcDateDiff(startDate, endDate)} dias)",
        style: TextStyle(fontSize: 15),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText("Salário: R\$ ${resume?.salary}", style: TextStyle(fontSize: 23)),
          TextButton(onPressed: () async {await Future.delayed(Duration(milliseconds: 400)); setState(() {});}, child: Icon(Icons.refresh, color: Color.fromARGB(255, 218, 147, 67),))
        ],
      ),
      SizedBox(height: 20),
      _buildResumeTable(resume),
    ];
  }

  Widget _buildResumeTable(IResume? resume) {
    _header({String? text, Widget? widget}) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        color: Color.fromARGB(255, 199, 133, 58), 
        child: (text != null) ? Text("${text}", 
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))
      ) : widget
      );
    }
    _tableHeaders() {
      return [
        _header(text: "#"),
        _header(
          widget: Row(
            children: [
              SelectableText("Receita", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))),
              SizedBox(width: 5),
              Tooltip(message: 'Detalhes', child: InkWell(onTap: () => RevExPDetails.getDetails(context, resume?.revenues), child: Icon(Icons.info_outlined, size: 13, color: Colors.blue[200]))),
            ],
          )
        ),
        _header(
          widget: Row(
            children: [
              SelectableText("Despesa", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))),
              SizedBox(width: 5),
              Tooltip(message: 'Detalhes', child: InkWell(onTap: () => RevExPDetails.getDetails(context, resume?.expenses), child: Icon(Icons.info_outlined, size: 13, color: Colors.blue[200]))),
            ],
          )
        ),
        _header(text: "Saldo"),
        _header(text: "Status")
      ];
    }
    
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _tableHeaders(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectableText("", style: TextStyle(fontSize: 12)),
              SelectableText("R\$ ${resume?.revenues?.total}", style: TextStyle(fontSize: 12)),
              SelectableText("R\$ ${resume?.expenses?.total}", style: TextStyle(fontSize: 12)),
              SelectableText("R\$ ${resume?.balance}", style: TextStyle(fontSize: 12)),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  (resume?.status == "positivo") ? Icons.done : Icons.close,
                  color: (resume?.status == "positivo") ? Colors.green : Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  
}