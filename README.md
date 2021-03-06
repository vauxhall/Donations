# Donations

![iOS](https://img.shields.io/badge/iOS-9.0%2B-blue.svg)
![Swift](https://img.shields.io/badge/Swift-4.2.1-blue.svg)

- [Description](#description)
- [Structure](#structure)
  - [Project](#project)
- [Contributing](#contributing)
  - [Requirements](#requirements)


# Description
Donations is an application that allows you to donate and share your donations on social media.


# Structure
## Project
The entry point for the project is the **Donations Workspace**.


The workspace contains one Xcode Project named **Donations**.


Donations project contains 3 different targets:


- Donations
- Tests
- Application


### Donations
A **Static Library**.

The business layer and entities of the project is extracted and encapsulated in this target.

The rationale behind creating a different target for this layer is to improve testability and encapsulation. In order to truly create _Unit Tests_ the tested subjects should be separated from the Application layer (the UI).

The outcome of this is that whenever we need to run the automated tests it is not necessary to start the application, with the following advantages:

- Running the tests is sometimes up to 80% faster
- CI would also runs the tests faster
- Any action taken by the application when running is not executed when testing, for example requesting data from a server.
- If at any point the project needs to install third party dependencies, let's say, through the use of _CocoaPods_, these doesn't have to be installed in order to run the tests.
- Tests are more reliable as they don't depend anymore on the application.


Additionally by encapsulating this layer in a separated target we are encouraged to create interfaces (protocols) and therefor public APIs for our own entities, enforcing the [Dependency Inversion Principle](https://martinfowler.com/articles/injection.html).


It is a static library and not a dynamic library because being static the module gets installed in the same namespace of the application, improving performance.


### Tests
A **Unit Testing Bundle**

For the moment we are focusing on Unit Testing, in the future we might come with adding some Integration and UI Testing, but these do not come as a priority. We are not against adding those other kind of testing, it is more important to us though that the Application layer (UI) and Integration layer are more flexible and easy to change.

We consider the business layer mission critical, therefor it should come along with a well defined and trusted set of tests, maintained constantly, and refactored whenever needed (refactor the tests). Whenever possible Test Driven Development (TDD) should be applied in the process.


We are not concern at all in _Test Coverage_ though, as we don't think this adds neither removes quality from a project.


### Application
An **iOS Application target**

The UI of the project.

The details of the project, everything that is volatile and that we should be able to change everyday, multiple times a day if necessary.

This section of the project is not meant to be Unit Tested. In the future we might consider adding some Integration Test or UI Tests, but they don't come as a priority.

Following the [Dependency Inversion Principle](https://martinfowler.com/articles/injection.html) this part of the project should depend on the business layer (import the business layer), and the business layer should not know anything about this layer, therefore allowing us to have as many UI as we want and as different among them as they need to be, all sharing the same business logic.


This layer of the project is divided in two sections:


- Presenter
- View


#### Presenter
The bridge between the business layer and the user facing layer, the UI.

Should know as much as necessary of the business layer so it can prepare the ViewModels but know nothing how these ViewModels are going to be displayed to the user.

We consider ViewModel as a collection of elements with relation among them and enough information of how they should be displayed to the user. They should resemble data in the business layer but not necessarily be part of it.

The Presenter is in charge of notifying the View whenever new information is ready to be displayed.


#### View
The user facing interface. The endpoint of the details of the application, therefore as volatile as it gets and should be as flexible to change as possible.

Should own the Presenter layer and depend on it.


We decided to entirely create the UI programatically, as we consider is more flexible than working directly with Interface Builders and Storyboards or Nib files.

We consider we can have more control of what is happening and of the lifecycle of our UI elements by doing it so.

At the same time we believe it improves code reviews when instead of looking at a XML file written by the Interface Builder you are looking at Swift code written by another human being.


# Contributing
## Requirements
- Xcode 10.1 or above.
- All code should be written on Swift 4.2.1 or above and avoid adding Objective-C code at all, for maintainability.
- We encourage the use of Extreme Programming practices and most importantly Test Driven Development.
