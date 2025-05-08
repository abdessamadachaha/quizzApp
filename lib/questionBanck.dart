import 'package:quizzapp/homepage.dart';
import 'package:quizzapp/question.dart';

class Questionbanck {
  int numberContent = 0;
  final List<Question> _content = [
    Question("A football match is 90 minutes long.", true),
    Question("Each team has 12 players on the field during a match.", false),
    Question(
      "The goalkeeper is the only player allowed to use their hands.",
      true,
    ),
    Question("Lionel Messi has never won a Ballon d'Or.", false),
    Question("The FIFA World Cup is held every 2 years.", false),
    Question(
      "Offside is when a player is closer to the opponent’s goal than the ball when it is played to them.",
      true,
    ),
    Question(
      "A red card means the player is sent off and cannot be replaced.",
      true,
    ),
    Question("The UEFA Champions League is for national teams.", false),
    Question("Brazil has won the FIFA World Cup 5 times.", true),
    Question("A football pitch must be exactly 100 meters long.", false),
    Question(
      "Cristiano Ronaldo has played for both Manchester United and Real Madrid.",
      true,
    ),
    Question(
      "A hat-trick means a player scored three goals in one match.",
      true,
    ),
    Question(
      "A penalty kick is taken from 12 yards (11 meters) away from goal.",
      true,
    ),
    Question("VAR stands for Video Automated Referee.", false),
    Question("The World Cup trophy is made entirely of gold.", false),
  ];

  String getQuestion() {
    return _content[numberContent].questionText!;
  }

  bool getAnswer() {
    return _content[numberContent].answer!;
  }

  void nextQuestion() {
    if (numberContent < _content.length - 1) {
      numberContent++;
    }
  }

  List<Question> getQuestionBank() {
    return _content;
  }
}
