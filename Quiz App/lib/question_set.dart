class QuestionSet {
  String question;
  List<dynamic> options;
  dynamic rightAnswer;
  dynamic givenAnswer;


  @override
  String toString() {
    return 'QuestionSet{question: $question, options: $options, rightAnswer: $rightAnswer, givenAnswer: $givenAnswer}';
  }

  QuestionSet(
      {required this.question, required this.options, required this.rightAnswer, required this.givenAnswer});
}

List<QuestionSet> questionList = [
  QuestionSet(
    question: 'Which of the following is not a built in type in Dart?',
    options: ['int', 'float', 'bool', 'Function'],
    rightAnswer: 'float',
    givenAnswer: ''
  ),
  QuestionSet(
      question: 'Which one is false?',
      options: [
        'Abstract method doesn’t have a body',
        'Abstract classes cannot be instantiated',
        'A class can have multiple constructors',
        'A class can’t implement another class and can be mixed with another class at the same time'],
      rightAnswer: 'A class can’t implement another class and can be mixed with another class at the same time',
      givenAnswer: ''
  ),
  QuestionSet(
      question: 'True/False: Positional arguments cannot have a default value',
      options: ['True', 'False'],
      rightAnswer: 'True',
      givenAnswer: ''
  ),
  QuestionSet(
      question: 'The _______ function is a predefined method in Dart',
      options: ['declare', 'list', 'main', 'return'],
      rightAnswer: 'main',
      givenAnswer: ''
  ),
  QuestionSet(
      question: 'SDK stands for _____',
      options: ['System Dart Kernel', 'Software Development Kernel', 'Software Development Kit', 'Software Design Key'],
      rightAnswer: 'Software Development Kit',
      givenAnswer: ''
  ),
  QuestionSet(
      question: 'SDK stands for _____',
      options: ['System Dart Kernel', 'Software Development Kernel', 'Software Development Kit', 'Software Design Key'],
      rightAnswer: 'Software Development Kit',
      givenAnswer: ''
  ),
  QuestionSet(
      question: 'SDK stands for _____',
      options: ['System Dart Kernel', 'Software Development Kernel', 'Software Development Kit', 'Software Design Key'],
      rightAnswer: 'Software Development Kit',
      givenAnswer: ''
  ),
  QuestionSet(
      question: 'SDK stands for _____',
      options: ['System Dart Kernel', 'Software Development Kernel', 'Software Development Kit', 'Software Design Key'],
      rightAnswer: 'Software Development Kit',
      givenAnswer: ''
  ),
  QuestionSet(
      question: 'SDK stands for _____',
      options: ['System Dart Kernel', 'Software Development Kernel', 'Software Development Kit', 'Software Design Key'],
      rightAnswer: 'Software Development Kit',
      givenAnswer: ''
  ),
];