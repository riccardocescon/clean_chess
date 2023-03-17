# **Clean Chess Structure**
This project is made up of different package, each one has it's own structure.
We will explain here the architecture for the `clean_chess` package.
For the other packages, please refer to their respective repository.
- [LichessClient](https://github.com/alexrintt/lichess.dart) Package for handling and parsing Lichess APIs calls into models
- [ChessKit](https://github.com/alexrintt/chesskit) Package for handling Chess models

## CleanChess
CleanChess is built using the TDD pattern.

TDD stands for `Test Driven Development`, so please write tests before doing PR.
Read in the appropriate section for more information.

By pulling this project you should notice 2 folders under the lib directory:

    |lib
    |--- core
    |--- features
Inside the `features\clean_chess` folder you will see the 3 layers in which this app is built.

 - Data
 - Domain
 - Presentation

Each layer has it's own structure, which is explained below.

### Data
    |data
    |--- datasources
    |--- models
    |--- repositories
The Data layer is the layer that contains the implementation of the data sources.
The `data sources` are the classes that are responsible for getting the data from the outside world.
At the moment of writing this document, the only data source is the Lichess API.
The data layer also contains the implementation of the `repositories`.
The repositories are the classes that are responsible for getting the data from the data sources.
The models are the classes that are used to map the data from the data sources to the domain layer.

### Domain
    |domain
    |--- entities
    |--- repositories
    |--- usecases

The Domain layer is the layer that contains the implementation of the entities and the use cases.
The `entities` are the classes that are used to map the data from the data layer to the presentation layer.
The `use cases` are the classes that are responsible for getting the data from the repositories.
The `repositories` are the classes that are responsible for getting the data from the data sources.
The repositories are implemented in the data layer, but they are defined in the domain layer.

### Presentation
    |presentation
    |--- bloc
    |--- pages
    |--- widgets

The Presentation layer is the layer that contains the implementation of the pages and the widgets.
The `pages` are the classes that are responsible for displaying the data to the user.
The `widgets` are the classes that are responsible for displaying the data to the user.
The `bloc` are the classes that are responsible for getting the data from the use cases.

Inside the `core` folder you will see the same structure as the `features\clean_chess` folder.
The `core` folder contains the utilities that are used by the `features\clean_chess` folder.

# Tests
When doing PR make sure you have written working tests for all the features you have implemented.

The tests must include:
- Test on success
- Test for each possible failure

To write the tests we use:
- flutter_test
- build_runner
- mockit
- test_block

For an example of how to write a test you can take a cue from those concerning [Authorization](https://github.com/riccardocescon/clean_chess/blob/main/test/features/cleanchess/presentation/bloc/lichess_bloc_mocks.dart)
