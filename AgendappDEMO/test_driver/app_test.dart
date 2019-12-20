import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/schedule_page_steps.dart';
import 'steps/login_steps.dart';
Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..stepDefinitions = [ExpectToBeInSchedule(), HitsScheduleIcon(), UserOnSchedule(),
      ExpectToLogin(),InsertUsername(),InsertPassword(),TapLoginButton(),SeeHomePage()]
    ..reporters = [ProgressReporter(), TestRunSummaryReporter()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true;

  return GherkinRunner().execute(config);
}