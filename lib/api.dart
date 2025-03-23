// Openapi Generator last run: : 2025-03-23T14:52:17.496795
import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: AdditionalProperties(
    sourceFolder: 'gamevault_api',
      pubName: 'gamevault_client_sdk',
      pubVersion: '0.0.1',
      pubHomepage:
          'https://github.com/felixjulianheitmann/gamevault_client_sdk.git',
      pubDescription:
          'Just the auto-generated client sdk for the gamevault API'
  ),
  inputSpec: InputSpec(path: 'gamevault_api.json'),
  generatorName: Generator.dart,
  outputDirectory: 'sdk',
  skipSpecValidation: true,
)
class GvApi {}