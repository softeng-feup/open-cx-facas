import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ExpectToLogin extends GivenWithWorld<FlutterWorld> {
  ExpectToLogin() : super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"A user wants to Log into the app");
}

class InsertUsername extends WhenWithWorld<FlutterWorld> {
  InsertUsername() : super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    String input = "username";
    await FlutterDriverUtils.enterText(world.driver, find.byValueKey("Username"), input);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User types username");
}

class InsertPassword extends AndWithWorld<FlutterWorld> {
  InsertPassword(): super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    String input = "1234";
    await FlutterDriverUtils.enterText(world.driver, find.byValueKey("Password"), input);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User types password");

}

class TapLoginButton extends AndWithWorld<FlutterWorld> {
  TapLoginButton(): super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.tap(world.driver, find.byValueKey("LoginButton"));
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User taps login button");

}

class SeeHomePage extends AndWithWorld<FlutterWorld> {
  SeeHomePage(): super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.waitForFlutter(world.driver);
    final SerializableFinder scheduleScreen = find.byValueKey("AllTalksPage");
    await FlutterDriverUtils.isPresent(scheduleScreen, world.driver);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User should be successfully logged");

}