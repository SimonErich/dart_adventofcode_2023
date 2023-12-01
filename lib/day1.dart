import 'utils/fetch_remote_content.dart';

void main() async {
  // fetch the list
  final inputList =
      await fetchRemoteContent('https://adventofcode.com/2023/day/1/input');

  // Solution 1
  final solution1Sum = removeNonNumericChars(inputList);
  print('Solution 1 - Sum: $solution1Sum');

  // Solution 2
  final onlyNumericNumberList = numberStringsToNumbers(inputList);
  final solution2Sum = removeNonNumericChars(onlyNumericNumberList);
  print('Solution 2 - Sum: $solution2Sum');
}

/// Takes a string and returns the sum over all lines of the first and last numeric values in each line.
int removeNonNumericChars(String input) {
  return input
      .split('\n')
      .map<String>(getFirstLastNumberSum)
      .map<int>(int.parse)
      .reduce((value, element) => value + element);
}

/// Takes the first and last numeric value of a line and returns their sum.
String getFirstLastNumberSum(line) {
  // remove all non-numeric characters
  final numericLine = line.replaceAll(RegExp(r'[^0-9]'), '');

  // if line is empty, return 0
  if (numericLine.isEmpty) {
    return '0';
  }

  // get first and last characters
  final first = numericLine[0];
  final last =
      (numericLine.length > 1) ? numericLine[numericLine.length - 1] : '';

  return first + last;
}

/// Replaces all non-numeric number annotations with their respective numeric counterpart
String numberStringsToNumbers(String input) {
  // create a map of all replacements and YEAH this is a bit of cheating,
  // because of the issue, that "twone" is 21 and "nineight" is "98" and not "9ight" as I would have expected
  final replaceArr = {
    'one': 'on1e',
    'two': 't2wo',
    'three': 'th3ree',
    'four': 'fo4ur',
    'five': 'fi5ve',
    'six': 'si6x',
    'seven': 'sev7en',
    'eight': 'ei8ght',
    'nine': 'ni9ne',
  };

  // loop through replace array and make the replacement
  replaceArr.forEach((key, value) {
    input = input.replaceAll(key, value);
  });

  return input;
}
