import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class ExpectToBeInPage extends Given1WithWorld<String, FlutterWorld> {

  ExpectToBeInPage() : super(StepDefinitionConfiguration()
    ..timeout = Duration(seconds: 10));

  @override
  RegExp get pattern => RegExp(r"I expect to be in {string}");


  @override
  Future<void> executeStep(String name) async {
    bool isInPage;
    if (name == "any page")
      isInPage = true;
    else {
      isInPage =
      await FlutterDriverUtils.isPresent(find.byType(name), world.driver);
    }

    expectMatch(isInPage, true);
  }
}

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