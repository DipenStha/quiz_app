import 'package:flutter/material.dart';
import '../data/quiz_questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.orangeAccent;
    final PageController controller = PageController();
    List<Color> buttonColors = [
      Colors.teal,
      Colors.teal,
      Colors.teal,
      Colors.teal
    ];
    void checkAnswers(int questionIndex, int optionIndex, currentIndex,
        String selectedOptiion) {
      if (quiz[currentIndex].correctOption == selectedOptiion) {
        setState(() {
          buttonColors[currentIndex] = Colors.green;
        });
      }
    }

    void resetColors() {
      setState(() {
        buttonColors = [Colors.white, Colors.white, Colors.white, Colors.white];
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: PageView.builder(
            controller: controller,
            itemCount: quiz.length,
            reverse: false,
            itemBuilder: ((context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${quiz[index]}",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButton(
                                color: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  if (options[index][0] == answers[index]) {
                                    setState(() {
                                      buttonColor = Colors.green;
                                    });
                                  } else {
                                    buttonColor = Colors.red;
                                  }
                                },
                                child: Text(
                                  "${options[index][0]}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              MaterialButton(
                                color: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  if (options[index][1] == answers[0]) {
                                    setState(() {
                                      buttonColor = Colors.green;
                                    });
                                  } else {
                                    buttonColor = Colors.red;
                                  }
                                },
                                child: Text(
                                  "${options[index][1]}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              MaterialButton(
                                color: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  if (options[index][2] == answers[index]) {
                                    setState(() {
                                      buttonColor = Colors.green;
                                    });
                                  } else {
                                    buttonColor = Colors.red;
                                  }
                                },
                                child: Text(
                                  "${options[index][2]}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              MaterialButton(
                                color: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  if (options[index][3] == answers[index]) {
                                    setState(() {
                                      buttonColor = Colors.green;
                                    });
                                  } else {
                                    buttonColor = Colors.red;
                                  }
                                },
                                child: Text(
                                  "${options[index][3]}",
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            controller.previousPage(
                                                duration: const Duration(
                                                    milliseconds: 50),
                                                curve: Curves.fastOutSlowIn);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            size: 40,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            controller.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 50),
                                                curve: Curves.fastOutSlowIn);
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward,
                                            size: 40,
                                          ))
                                    ]),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              );
            })));
  }
}
