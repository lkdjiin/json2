# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased][unreleased]
### Added
- Basic Json to Csv behavior, based on several Json examples.
- Works well with other command line tools by using a file as input or by
  listening to STDIN.
- Option `--without-header` to parse the Json when it doesn't seems to have
  *heading information* inside itself.
- Option `--path` to extract a selection of the Json file.
- Common switches `--version` and `--help`.
