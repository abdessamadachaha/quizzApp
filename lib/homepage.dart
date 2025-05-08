import 'package:flutter/material.dart';
import 'package:quizzapp/questionBanck.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Questionbanck questionbanck = Questionbanck();

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> scoore = [];

  void isFinish() {
    if (questionbanck.numberContent ==
        questionbanck.getQuestionBank().length - 1) {
      Alert(
        context: context,
        title: "Finished!",
        desc: "You've reached the end of the quiz.",
        buttons: [
          DialogButton(
            color: Colors.blue,
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                questionbanck.numberContent = 0;
                scoore.clear();
              });
              Navigator.pop(context);
            },
            width: 120,
          ),
        ],
      ).show();
    }
  }

  void isCheck(bool currectAnswer) {
    if (currectAnswer == questionbanck.getAnswer()) {
      scoore.add(Icon(Icons.check, color: Colors.blue));
    } else {
      scoore.add(Icon(Icons.close, color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/foot.png', fit: BoxFit.cover),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      questionbanck.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        questionbanck.nextQuestion();
                        isCheck(true);
                        isFinish();
                      });
                    },
                    child: Text(
                      'True',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        questionbanck.nextQuestion();
                        isCheck(false);
                        isFinish();
                      });
                    },
                    child: Text(
                      'False',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              Row(children: scoore),
            ],
          ),
        ],
      ),
    );
  }
}
