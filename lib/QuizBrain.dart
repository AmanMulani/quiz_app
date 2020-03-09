import 'questionBank.dart';

class QuizBrain{
  List <QuestionBank> _examQ = [
    QuestionBank(q: 'Did Sri Lanka win the ICC World Cup 2011?', a: false),
    QuestionBank(q: 'Earth has two satellites.', a: false),
    QuestionBank(q: 'Moon is the satellite of Mars.', a: false),
    QuestionBank(q: 'Einstein won the Nobel prize for photoelectric effect.', a: true),
    QuestionBank(q: 'Water can be split into Hydrogen and Oxygen', a: true),
    QuestionBank(q: 'Voldemort killed Dumbledore.', a: false),
    QuestionBank(q: 'Sachin Tendulkar has hit 101 centuries.', a: false),
    QuestionBank(q: 'The moon rises from west to east.', a: true),
    QuestionBank(q: 'Bulb was invented by J.J. Thomson,', a: true),
    QuestionBank(q: 'Langley played a very pivotal role along with Wright brothers in Airplane invention.', a: false),
    QuestionBank(q: 'Telephone was invented by Graham Bell.', a: true),
    QuestionBank(q: 'America was never ruled by any other country.', a: false),
    QuestionBank(q: 'Shangai is the largest city in whole Aisa.', a: true),
    QuestionBank(q: 'Rossum has invented Java.', a: false),
    QuestionBank(q: 'The name of Java prior to it\' launch was Oak.', a: true)
  ];

  int _questionNo = 0;

  String getQuestion() {
    return _examQ[_questionNo].question;
  }
  bool getCorrectAnswer() {
    return _examQ[_questionNo].ans;
  }
  int incrementQuestion() {
    if(_questionNo < _examQ.length-1)
      return _questionNo++;
    return _questionNo;
  }
  bool checkLimit() {
    if(_questionNo == _examQ.length - 1) {
      return true;
    }
    return false;
  }
  void resetQuestion() {
    _questionNo = 0;
  }
}