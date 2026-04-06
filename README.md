# Flutter Weather App

A sleek and modern Flutter application that provides real-time weather information for any city worldwide.

## Features

- **Real-time Weather Data**: Fetches the latest weather information using the OpenWeatherMap API.
- **Search Functionality**: Allows users to search for weather by city name.
- **Dynamic UI**: The app's background gradient changes dynamically based on the current weather conditions (e.g., Clear, Rain, or Cloud).
- **Detailed Weather Info**: Displays temperature (in Celsius), weather description, humidity, and wind speed.
- **Loading State**: Includes a circular progress indicator while fetching data from the API.

## Screenshots

*(Add screenshots here)*

## Getting Started

To get started with this project, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Malikfarooq/webApp.git
   ```

2. **Navigate to the project directory**:
   ```bash
   cd "Weathe App"
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

## Dependencies

- [http](https://pub.dev/packages/http): For making API requests to OpenWeatherMap.
- [cupertino_icons](https://pub.dev/packages/cupertino_icons): For iOS-style icons.

## API Usage

This app uses the [OpenWeatherMap API](https://openweathermap.org/api). You can find the API key in `lib/services/Weather_service.dart`. Note: It's recommended to use your own API key for production.

---
Created by [Malik Farooq](https://github.com/Malikfarooq)
