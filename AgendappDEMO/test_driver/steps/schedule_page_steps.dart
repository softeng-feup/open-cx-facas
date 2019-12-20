import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ExpectToBeInSchedule  extends GivenWithWorld<FlutterWorld> {
  ExpectToBeInSchedule () : super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    FlutterDriverUtils.tap(world.driver, find.byValueKey("LoginButton"));
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"A user wants to be in Schedule page");
}
class HitsScheduleIcon extends WhenWithWorld<FlutterWorld> {
  HitsScheduleIcon() : super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    FlutterDriverUtils.tap(world.driver, find.byValueKey("ScheduleButton"));
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User hits Schedule icon");
}

class UserOnSchedule extends ThenWithWorld<FlutterWorld> {
  UserOnSchedule(): super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.waitForFlutter(world.driver);
    final SerializableFinder scheduleScreen = find.byValueKey("SchedulePage");
    await FlutterDriverUtils.isPresent(scheduleScreen, world.driver);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User should land on Schedule page");

}