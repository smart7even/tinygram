import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart';

void main(List<String> args) {
  final parser = ArgParser();
  final generateFeatCommand = parser.addCommand('feature');
  generateFeatCommand.addOption('name', abbr: 'n', mandatory: true);
  final results = parser.parse(args);

  final command = results.command;

  if (command != null) {
    if (command.name == 'feature') {
      createNewFeature(command['name'] as String);
    }
  }
}

Future<void> createNewFeature(String featureName) async {
  final directory = Directory(join('lib', 'features'));

  if (directory.existsSync()) {
    throw Exception('Features directory does not exist');
  }

  final featureDirectory = Directory(join(directory.path, featureName));

  if (featureDirectory.existsSync()) {
    throw Exception('Feature $featureName already exists');
  }

  await featureDirectory.create();

  final dataDirectory = Directory(join(featureDirectory.path, 'data'));
  await dataDirectory.create();

  final repositoryDir = Directory(join(dataDirectory.path, 'repository'));
  await repositoryDir.create();

  final domainDirectory = Directory(join(featureDirectory.path, 'domain'));
  await domainDirectory.create();

  final repositoryInterfacesDir =
      Directory(join(domainDirectory.path, 'repository'));
  await repositoryInterfacesDir.create();

  final modelsDir = Directory(join(domainDirectory.path, 'models'));
  await modelsDir.create();

  final presentationDirectory =
      Directory(join(featureDirectory.path, 'presentation'));
  await presentationDirectory.create();

  final blocDir = Directory(join(presentationDirectory.path, 'bloc'));
  await blocDir.create();

  final widgetsDir = Directory(join(presentationDirectory.path, 'widgets'));
  await widgetsDir.create();

  final pagesDir = Directory(join(presentationDirectory.path, 'pages'));
  await pagesDir.create();
}
