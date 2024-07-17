# MDIL - Material Design Icons Light

[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
[![Pub Version](https://img.shields.io/pub/v/md_icons)](https://pub.dev/packages/md_icons)


A comprehensive collection of Material Design-inspired icons for Flutter applications, offering a wide range of icons for various use cases.

## Features

- **Extensive Icon Collection**: Includes a vast library of icons following Material Design guidelines.
- **Regular & Light Versions**: Provides both regular and light versions of icons for different design needs.
- **Customizable Usage**: Easily integrate icons into your Flutter apps with simple `Icon` widgets.
- **Regular Updates**: Regularly updated with new icons and improvements.

## Installation

Add the following line to your `pubspec.yaml` file:

> Note, icons are accessible only throught github

```yaml
dependencies:
  mdil: any
    git: 
      path: https://github.com/m7mdra/md_icons/mdil
      ref: main
```
# Usage
### Import the Package

```dart
import 'package:mdil/mdil.dart';

// some where in your code

Icon(MDIL.iconName);
// or
Icon(MDILight.iconName); 
// or
Icon(MaterialDesignIconsLight.iconName); 

```

and thats it.
