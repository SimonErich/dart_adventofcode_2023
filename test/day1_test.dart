import 'package:aoc/day1.dart';
import 'package:test/test.dart';

void main() {
  test('solution1 works correctly', () async {
    final mockDataList = '1abc2\n pqr3stu8vwx\n a1b2c3d4e5f\n treb7uchet';

    final solution1Sum =
        getSumOfFirstAndLastNumericValuesOfLinesInString(mockDataList);

    expect(solution1Sum, 142);
  });

  test('replaceWrittenNumbersWithNumericOnes replaces numbers correctly',
      () async {
    final mockDataList =
        'two1nine\neightwothree\nabcone2threexyz\nxtwone3four\n4nineeightseven2\nzoneight234\n7pqrstsixteen';
    final mockDataListExpected =
        't2wo1ni9ne\nei8ght2woth3ree\nabcon1e2th3reexyz\nxt2won1e3fo4ur\n4ni9neei8ghtsev7en2\nzon1ei8ght234\n7pqrstsi6xteen';

    final numericReplacedWords =
        replaceWrittenNumbersWithNumericOnes(mockDataList);

    expect(numericReplacedWords, mockDataListExpected);
  });

  test('solution2 works correctly', () async {
    final mockDataList =
        'two1nine\neightwothree\nabcone2threexyz\nxtwone3four\n4nineeightseven2\nzoneight234\n7pqrstsixteen';

    final numericReplacedWords =
        replaceWrittenNumbersWithNumericOnes(mockDataList);
    final solution2Sum =
        getSumOfFirstAndLastNumericValuesOfLinesInString(numericReplacedWords);

    expect(solution2Sum, 281);
  });
}