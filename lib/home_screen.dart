import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'match_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final database = FirebaseFirestore.instance;
/*
  Future<void> getMatchList() async{
    final QuerySnapshot result = await database.collection('MatchList').get();

    print(result.size);
    for(QueryDocumentSnapshot element in result.docs){
      print(element.data());
      print(element.get('Goal'));
    }
  }
  @override
  void initState() {
    super.initState();
    getMatchList() ;
  }

 */

  @override
  Widget build(BuildContext context) {
    print(database.collection('MatchList'));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Match List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: database.collection('MatchList').snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          print(snapshot.data?.docs);
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(snapshot.data?.docs[index]['Match']),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MatchStatus(matchTitle: snapshot.data?.docs[index])));
                    },
                  );
            });
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}
