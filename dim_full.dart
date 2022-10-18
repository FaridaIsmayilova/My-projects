import 'dart:io';

//Coders student: Farida
//Calculate university entrance exam (DIM) score for the first group
void main() {
  final int requiredScore = 350;
  final int eightPoint = 8;
  final int fourPoint = 4;
  final int lostPoint = 4;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int missedAnswers = 0;
  int result = 0;
  List<String> subjectList = [
    'maths',
    'physics',
    'chemistry',
    'English',
    'Azerbaijani'
  ];

  for (int i = 0; i < subjectList.length; i++) {
    print(
        'Enter number of CORRECT answers for ${subjectList[i].toUpperCase()}:');
    correctAnswers = int.parse(stdin.readLineSync()!);

    print('Enter number of WRONG answers for ${subjectList[i].toUpperCase()}:');
    wrongAnswers = int.parse(stdin.readLineSync()!);

    print(
        'Enter number of MISSED answers for ${subjectList[i].toUpperCase()}:');
    missedAnswers = int.parse(stdin.readLineSync()!);

    if (correctAnswers + wrongAnswers + missedAnswers == 25) {
      if (i == 0 || i == 1) {
        result = result + (correctAnswers - wrongAnswers ~/ lostPoint) * eightPoint;
      } else {
        result = result + (correctAnswers - wrongAnswers ~/ lostPoint) * fourPoint;
      }
    } else {
      print(
          '!!! Incorrect input for ${subjectList[i].toUpperCase()}. Sum of answers should be 25. Try again!');
      break;
      //Exit the loop if incorrect inputs
    }

    if (i == 4 && result >= requiredScore) {
      print('Congratulation, you passed the exam! Score: $result');
    } else if (i == 4 && result < requiredScore) {
      print('Unfortunately, you failed the exam. Score: $result. Required: $requiredScore');
    }
  }
