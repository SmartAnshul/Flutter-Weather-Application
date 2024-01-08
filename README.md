## Getting Started

## Overview
This Flutter application provides real-time weather information for a specified location using the public OpenWeatherMap API. It displays details such as current temperature, weather description, wind speed, humidity, and more.

## Features

- Display current weather conditions including temperature, description, and icon.
- Show additional weather details such as maximum and minimum temperature, wind speed, and humidity.
- Automatic location fetching (e.g., "Bengaluru" in the provided example).

## Libraries Used

- **weather** (v3.1.1): A Flutter package to fetch weather data from OpenWeatherMap API.
- **intl** (v0.19.0): Internationalization and localization library for Flutter.

## Code Structure
main.dart: The main entry point of the application. It initializes the Flutter app and sets the home page to HomePage.

home.dart: The HomePage widget is the main screen of the application. It utilizes the WeatherFactory from the weather package to fetch and display weather information.

consts.dart: Contains constant values, including the OpenWeatherMap API key (OPENWEATHER_API_KEY).

