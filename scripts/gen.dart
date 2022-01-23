import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart';

void main(List<String> args) {
  var parser = ArgParser();
  var generateFeatCommand = parser.addCommand('feature');
  generateFeatCommand.addOption('name', abbr: 'n', mandatory: true);
  var results = parser.parse(args);

  var command = results.command;

  if (command != null) {
    if (command.name == 'feature') {
      createNewFeature(command['name']);
    }
  }
}

Future<void> createNewFeature(String featureName) async {
  Directory directory = Directory(join('lib', 'features'));

  if (!await directory.exists()) {
    throw Exception('Features directory does not exist');
  }

  var featureDirectory = Directory(join(directory.path, featureName));

  if (await featureDirectory.exists()) {
    throw Exception('Feature $featureName already exists');
  }

  await featureDirectory.create();

  var dataDirectory = Directory(join(featureDirectory.path, 'data'));
  await dataDirectory.create();

  var repositoryDir = Directory(join(dataDirectory.path, 'repository'));
  await repositoryDir.create();

  var domainDirectory = Directory(join(featureDirectory.path, 'domain'));
  await domainDirectory.create();

  var repositoryInterfacesDir =
      Directory(join(domainDirectory.path, 'repository'));
  await repositoryInterfacesDir.create();

  var modelsDir = Directory(join(domainDirectory.path, 'models'));
  await modelsDir.create();

  var presentationDirectory =
      Directory(join(featureDirectory.path, 'presentation'));
  await presentationDirectory.create();

  var blocDir = Directory(join(presentationDirectory.path, 'bloc'));
  await blocDir.create();

  var widgetsDir = Directory(join(presentationDirectory.path, 'widgets'));
  await widgetsDir.create();

  var pagesDir = Directory(join(presentationDirectory.path, 'pages'));
  await pagesDir.create();
}
