class QNA {
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? option4;

  String? correctOption;
  QNA(
      {String? question,
      String? option1,
      String? option2,
      String? option3,
      String? option4,
      String? correctOption}) {
    this.question = question;
    this.option1 = option1;
    this.option2 = option2;
    this.option3 = option3;
    this.option4 = option4;
    this.correctOption = correctOption;
  }
}
