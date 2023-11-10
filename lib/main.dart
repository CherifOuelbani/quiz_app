import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();
void main() {
  runApp( ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.grey,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ExamPage(),
      ) ,
      ),
    );
  }
}
class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Padding> answerResult = [];
  int rightanswer=0  ;
  void chackanswer(bool theanswer) 
  {
     bool correctanswer =appBrain.GetAnswers();
     setState(() {
            if (correctanswer==theanswer) {
              rightanswer++; 
                answerResult.add(Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(Icons.thumb_up , color: Colors.green),
                ),);
            }
            else 
            answerResult.add(Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(Icons.thumb_down , color: Colors.red),
            ),);
               if (appBrain.Isfinished()==true ) {
              Alert(
      context: context,
      title: "NICE",
      desc: "You are just completed all the questions !! and you have $rightanswer right answers",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    appBrain.reset();
    answerResult=[];
    rightanswer=0;
            }
            else {
              appBrain.NextQuestion();
            } 
            });
         
  }

 
  int imageNumber=1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: answerResult ,
          ),

        Expanded(
          flex: 5,
          child: Column(children: [
          Image.asset(appBrain.GetQuestionImage()),
          SizedBox(height: 20.0),
          Text(appBrain.GetQuestionText(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25
          ),)
        ],)),
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0),
          child: TextButton(
          child:      
           Text('True',
           style: TextStyle(
            color: Colors.white ,
            fontSize: 45 
            ),),
          onPressed:  () {
           chackanswer(true);
           
         
          
            
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.indigo
          ),
          ),
        ),),
        
        Expanded(child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0),
          child: TextButton(
          child:      
           Text('False',
           style: TextStyle(
            color: Colors.white ,
            fontSize: 45 
            ),),
          onPressed: () {chackanswer(false);
            
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red
          ),
          ),
        ),),
      ],
    );
  }
}
