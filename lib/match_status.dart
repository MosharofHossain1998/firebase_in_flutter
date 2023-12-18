import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchStatus extends StatefulWidget {
  const MatchStatus({super.key, required this.matchTitle});
  final dynamic matchTitle;

  @override
  State<MatchStatus> createState() => _MatchStatusState();
}

class _MatchStatusState extends State<MatchStatus> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.matchTitle['Match']),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 150,
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.matchTitle['Match'],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.grey),),
                  Text(widget.matchTitle['Goal'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                  Text("Time : ${widget.matchTitle['Rtime']}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                  Text("Total Time : ${widget.matchTitle['Ftime']}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
