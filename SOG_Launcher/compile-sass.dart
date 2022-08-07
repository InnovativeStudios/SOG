import 'dart:io';
import 'package:sass/sass.dart';

void main(List<String> arguments) {
	var result = sass.compile(arguments[0]);
	new File(arguments[1]).writeAsStringSync(result);
}