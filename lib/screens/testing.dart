import 'package:flutter/material.dart';
import 'package:quiz_app/models/qna_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();

  List<QNA> questions = [
    QNA(
      question: "What is the capital of India?",
      option1: "Delhi",
      option2: "Mumbai",
      option3: "Kolkata",
      option4: "Chennai",
      correctOption: "Delhi",
    ),
    QNA(
      question: "Which country is known as the Land of the Rising Sun?",
      option1: "China",
      option2: "India",
      option3: "Japan",
      option4: "Australia",
      correctOption: "Japan",
    ),

    QNA(
      question: "What is the largest desert in the world?",
      option1: "Sahara Desert",
      option2: "Gobi Desert",
      option3: "Arabian Desert",
      option4: "Kalahari Desert",
      correctOption: "Sahara Desert",
    ),

    QNA(
      question: "Which planet is known as the Red Planet?",
      option1: "Mars",
      option2: "Venus",
      option3: "Mercury",
      option4: "Jupiter",
      correctOption: "Mars",
    ),

    QNA(
      question: "What is the tallest mountain in the world?",
      option1: "Mount Everest",
      option2: "K2",
      option3: "Makalu",
      option4: "Kangchenjunga",
      correctOption: "Mount Everest",
    ),

    QNA(
      question: "Which city is home to the Eiffel Tower?",
      option1: "London",
      option2: "Rome",
      option3: "Paris",
      option4: "Berlin",
      correctOption: "Paris",
    ),

    QNA(
      question: "What is the largest ocean in the world?",
      option1: "Atlantic Ocean",
      option2: "Indian Ocean",
      option3: "Arctic Ocean",
      option4: "Pacific Ocean",
      correctOption: "Pacific Ocean",
    ),

    QNA(
      question: "Which country is known as the Land of the Midnight Sun?",
      option1: "Sweden",
      option2: "Norway",
      option3: "Finland",
      option4: "Russia",
      correctOption: "Norway",
    ),

    QNA(
      question: "What is the national animal of Australia?",
      option1: "Kangaroo",
      option2: "Koala",
      option3: "Platypus",
      option4: "Emu",
      correctOption: "Kangaroo",
    ),

    QNA(
      question: "Which instrument is known as the 'king of instruments'?",
      option1: "Piano",
      option2: "Violin",
      option3: "Guitar",
      option4: "Pipe organ",
      correctOption: "Pipe organ",
    )

    //   make another question
  ];

  List<Color> buttonColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  void resetColors() {
    setState(() {
      buttonColors = [
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
      ];
    });
  }

  void checkAnswer(
      int currentQIndex, int currentOptionIndex, String selectedOption) {
    if (questions[currentQIndex].correctOption == selectedOption) {
      setState(() {
        buttonColors[currentOptionIndex] = Colors.green;

        for (int i = 0; i < 4; i++) {
          if (i == currentOptionIndex) {
            continue;
          }
          buttonColors[i] = Colors.red;
        }
        Future.delayed(Duration(seconds: 2), () {
          _pageController.nextPage(
              duration: Duration(milliseconds: 250), curve: Curves.easeIn);
          resetColors();
        });
      });
    } else {
      setState(() {
        buttonColors[currentOptionIndex] = Colors.red;
        for (int i = 0; i < 4; i++) {
          // if (questions[currentQIndex].correctOption == selectedOption) {
          //   buttonColors[i] = Colors.green;
          //   continue;
          // }
          // if (i == currentOptionIndex) {
          //   buttonColors[i] = Colors.green;
          // }
          buttonColors[i] = Colors.red;
        }
        Future.delayed(Duration(seconds: 2), () {
          _pageController.nextPage(
              duration: Duration(milliseconds: 250), curve: Curves.easeIn);
          resetColors();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Footstep'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _pageController,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                        child: Container(
                      child: Text(
                        questions[index].question!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.teal),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                    minWidth: 200,
                                    color: buttonColors[0],
                                    onPressed: () {
                                      checkAnswer(
                                          index, 0, questions[index].option1!);
                                    },
                                    child: Text(questions[index].option1!)),
                                MaterialButton(
                                    minWidth: 200,
                                    color: buttonColors[1],
                                    onPressed: () {
                                      checkAnswer(
                                          index, 1, questions[index].option2!);
                                    },
                                    child: Text(questions[index].option2!)),
                                MaterialButton(
                                    minWidth: 200,
                                    color: buttonColors[2],
                                    onPressed: () {
                                      checkAnswer(
                                          index, 2, questions[index].option3!);
                                    },
                                    child: Text(questions[index].option3!)),
                                MaterialButton(
                                    minWidth: 200,
                                    color: buttonColors[3],
                                    onPressed: () {
                                      checkAnswer(
                                          index, 3, questions[index].option4!);
                                    },
                                    child: Text(questions[index].option4!)),
                              ],
                            ),
                          ),
                        )),
                  ],
                );
              },
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                  icon: Icon(Icons.arrow_back)),
              IconButton(onPressed: () {}, icon: Icon(Icons.grid_3x3_outlined)),
              IconButton(
                  onPressed: () {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                  icon: Icon(Icons.arrow_forward)),
            ],
          ))
        ],
      ),
    );
  }
}
