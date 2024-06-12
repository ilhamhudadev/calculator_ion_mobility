


# Let's Calc | Minimalist Calculator

![Alt text](https://github.com/ilhamhudadev/calculator_ion_mobility/blob/main/assets/images/cover.jpg?raw=true)


## Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Running Tests](#running-tests)

## Project Description

The Flutter Calculator is a simple, yet powerful calculator application built with Flutter. It showcases the use of the BLoC (Business Logic Component) pattern for state management, providing a clear separation of concerns and making the app easy to maintain and extend.

## Features

- Basic arithmetic operations (addition, subtraction, multiplication, division).
- Input sanitization to remove leading zeros.
- History tracking of calculations.
- Result formatting to handle trailing zeros and limit decimal places.

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed [Flutter](https://flutter.dev/docs/get-started/install)
- You have a running emulator or a physical device connected.
- You have basic knowledge of Dart and Flutter.

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/ilhamhudadev/calculator_ion_mobility
cd calculator_ion_mobility
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Run the app**

```bash
flutter run
```

## Usage

Let's Calc app is straightforward to use:

- **Buttons**: Tap the buttons to input numbers and operations.
- **CLEAR**: Resets the input and result.
- **BACK**: Removes the last character from the input.
- **=**: Evaluates the expression and displays the result.
- **History**: Displays the list of previous calculations.

## Running Tests

This project includes both unit tests and widget tests to ensure the correctness of the application logic and UI.

1. **Run all tests**

```bash
flutter test
```

2. **Unit Tests**

Unit tests for the BLoC logic can be found in `module/main/test/unit_test.dart`.

3. **Widget Tests**

Widget tests for the UI can be found in `module/main/test/widget_test.dart`.


