
import 'questions.dart';
class AppBrain {
   int _questionNumber=0  ;
   List<Question>_questionGroupe=[Question(
  q:'The number of planets in the solar system is eight ',
i:'images/image-1.jpg',
a: true ),
Question(
  q:' cats are carnivorous animals ',
i:'images/image-2.jpg',
a: true ),
Question(
  q:'China is located in Africa ',
i:'images/image-3.jpg',
a: false ),
Question(
  q:'The earth is flat ',
i:'images/image-4.jpg',
a: false ),
];
void NextQuestion(){
  if(_questionNumber< _questionGroupe.length-1){
    _questionNumber++;
  }
}


String GetQuestionText (){
  return _questionGroupe[_questionNumber].questiontext;
}
String GetQuestionImage (){
  return _questionGroupe[_questionNumber].questionimage;
}
bool GetAnswers (){
  return _questionGroupe[_questionNumber].answers;
}
bool Isfinished(){
  if(_questionNumber>= _questionGroupe.length - 1){
       return true ;
  }
  else return false ;
}
void reset(){
  
       _questionNumber=0 ;
  
  
}

}
