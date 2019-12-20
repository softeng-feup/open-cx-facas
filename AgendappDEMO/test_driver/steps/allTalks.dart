import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ExpectToBeInAllTalks extends GivenWithWorld<FlutterWorld> {
  ExpectToBeInAllTalks() : super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    FlutterDriverUtils.tap(world.driver, find.byValueKey("LoginButton"));
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"A user wants to be in allTalks page");
}
class HitsAllTalksIcon extends ThenWithWorld<FlutterWorld> {
  HitsAllTalksIcon() : super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    FlutterDriverUtils.tap(world.driver, find.byValueKey("MenuBar"));
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User hits allTalks icon");
}

class UserOnAllTalks extends ThenWithWorld<FlutterWorld> {
  UserOnAllTalks(): super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.waitForFlutter(world.driver);
    final SerializableFinder scheduleScreen = find.byValueKey("AllTalksPage");
    await FlutterDriverUtils.isPresent(scheduleScreen, world.driver);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User should land on allTalks page");

}
/*
class AllTalksButton extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    
    await FlutterDriverUtils.tap(world.driver, find.byValueKey('All Talks'));

  }

  @override
  RegExp get pattern => RegExp(r"user hits allTalks icon");

}

class NavValidation extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String name) async {

    await FlutterDriverUtils.waitForFlutter(world.driver);
    bool isInPage = await FlutterDriverUtils.isPresent(find.byValueKey(name), world.driver);
    expectMatch(isInPage, true);
  }

  @override
  RegExp get pattern => RegExp(r"user should land on {string}");

}

 */