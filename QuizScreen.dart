import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/CalculatorScreen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  SharedPreferences? sharedPreferences;
  int highestScore = 0;
  int quizNumber = 1;
  int questionIndex = 0;
  int score = 0;
  bool isAnswered = false;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      highestScore = sharedPreferences?.getInt('highestScore') ?? 0;
    });
  }

  void updateHighestScore() async {
    final currentScore = await sharedPreferences?.getInt('highestScore');
    if (currentScore != null) {
      if (score > currentScore) {
        await sharedPreferences?.setInt('highestScore', score);
        setState(() {
          highestScore = score;
        });
      }
    } else {
      await sharedPreferences?.setInt('highestScore', score);
      setState(() {
        highestScore = score;
      });
    }
  }

  List<String> questions = [
    'What is the capital of Bangladesh?',
    '845/25=?',
    'What is the value of log 100?',
    '88 + 95 = ?'
  ];

  List<List<String>> options = [
    ['Mymensingh', 'Sylhet', 'Barisal', 'Dhaka'],
    ['33.8', '31.8', '32.8', '34.8'],
    ['10', '3', '2', '4'],
    ['165', '205', '183', '175'],
  ];

  List<String> correctAnswers = ['Dhaka', '33.8', '2', '183'];

  List<String> selectedAnswers = [];

  void checkAnswer(String selectedOption) {
    if (isAnswered) {
      return;
    }

    String correctAnswer = correctAnswers[questionIndex];
    bool isCorrect = selectedOption == correctAnswer;

    setState(() {
      selectedAnswers.add(selectedOption);
      isAnswered = true;

      if (isCorrect) {
        score++;
        sharedPreferences?.setInt('highestScore', score);
      }
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        if (questionIndex < questions.length - 1) {
          questionIndex++;
          isAnswered = false;
        } else {}
      });
    });
  }

  void shareScore() {
    String message =
        'I scored $score out of ${questions.length} in the quiz app!';
    Share.share(message);
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers.clear();
      questionIndex = 0;
      quizNumber++;
      score = 0;
      isAnswered = false;
    });
  }

  void updateHighScore() {
    if (score > highestScore) {
      setState(() {
        highestScore = score;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Column(
        children: [
          Text(
            'Question ${questionIndex + 1}: ${questions[questionIndex]}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: options[questionIndex].length,
            itemBuilder: (context, index) {
              bool isSelected =
                  selectedAnswers.contains(options[questionIndex][index]);
              bool isCorrect = options[questionIndex][index] ==
                  correctAnswers[questionIndex];
              bool showCorrectAnswer = isAnswered && isCorrect;

              Color backgroundColor = Colors.transparent;
              if (isSelected) {
                backgroundColor = isCorrect ? Colors.green : Colors.red;
              } else if (showCorrectAnswer) {
                backgroundColor = Colors.green;
              }

              return GestureDetector(
                onTap: () {
                  if (!isSelected) {
                    checkAnswer(options[questionIndex][index]);
                  }
                },
                child: Container(
                  color: backgroundColor,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        '${String.fromCharCode(65 + index)}.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        options[questionIndex][index],
                        style: TextStyle(
                          color: isSelected || showCorrectAnswer
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Text(
            'Score: $score / ${questions.length}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: shareScore,
          ),
          IconButton(
            icon: Icon(Icons.calculate),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculatorScreen()),
              );
            },
          ),
          SizedBox(height: 20),
          if (selectedAnswers.contains(correctAnswers[questionIndex]))
            Text(
              'Correct Answer: ${correctAnswers[questionIndex]}',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          Text(
            'Highest Score: $highestScore',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          updateHighScore();
          resetQuiz();
        },
        child: Text('Next Quiz'),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quiz $quizNumber',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'High Score: $highestScore',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: QuizScreen(),
  ));
}
