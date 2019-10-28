import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionKeeper = [
    Question(
        questionType: 'Buhari is the President of Nigeria',
        questionAnswer: true),
    Question(
        questionType: 'Sanwoolu is not the governor of lagos state',
        questionAnswer: false),
    Question(
        questionType: 'Nigeria is a fucked up country', questionAnswer: true),
    Question(questionType: 'We rise by lifting others', questionAnswer: true),
    Question(
        questionType: 'There are still sane people in this country',
        questionAnswer: false)
  ];

  void checkQuestions() {
    if (_questionNumber < _questionKeeper.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionType() {
    return _questionKeeper[_questionNumber].questionType;
  }

  bool getQuestionAnswer() {
    return _questionKeeper[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionKeeper.length - 1) {
      print('finished');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
