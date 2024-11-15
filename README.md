# Weather App 🌦️

A Flutter-based Weather App that provides real-time weather updates for any city using a search interface. This app fetches weather information, displays dynamic weather icons based on conditions, and offers a clean and intuitive user interface.

---

## Features ✨

- **Real-Time Weather Information**:
  - Displays current temperature, "feels like" temperature, and weather conditions for the searched city.
- **Dynamic Weather Icons**:
  - Weather icons change based on temperature or weather descriptions (e.g., sunny, cloudy, rainy, snow).
- **Search Functionality**:
  - A text field to search for any city and fetch its weather details.
- **Error Handling**:
  - Alerts users when the search fails or there's no internet connection.
- **Responsive Design**:
  - Ensures smooth functionality across devices with an elegant UI.

---

## Tech Stack 🛠️

- **Flutter**: For building the cross-platform app.
- **Bloc Pattern**: To manage state efficiently.
- **OpenWeatherMap API**: For fetching weather data.
- **flutter_dotenv**: To manage API keys securely.
- **HTTP Package**: For API requests and responses.

---

## Installation and Setup 🚀

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/your-username/weather_app.git
   cd weather_app
   ```

2. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

3. **Setup API Key**:

   - Create a `.env` file in the root directory.
   - Add your API key from [OpenWeatherMap](https://openweathermap.org/) in the `.env` file:
     ```plaintext
     API_KEY=your_openweather_api_key
     ```

4. **Run the App**:
   ```bash
   flutter run
   ```

---

## Folder Structure 📂

```plaintext
lib/
├── bloc/              # Handles business logic using Bloc
├── data/              # Data models and API integration
├── screens/           # UI components for different screens
├── widgets/           # Reusable widgets
└── main.dart          # App entry point
```

---

## Environment Variables 🔐

Ensure sensitive data like API keys are stored securely. This app uses the `flutter_dotenv` package to manage environment variables. Remember to add `.env` to `.gitignore`:

```plaintext
.env
```

---

## API Reference 🌐

- **OpenWeatherMap API**:
  - Get your API key: [https://openweathermap.org/api](https://openweathermap.org/api)
  - Example endpoint for current weather:
    ```plaintext
    https://api.openweathermap.org/data/2.5/weather?q={city_name}&appid={API_KEY}
    ```

---

## To-Do List 📝

- Add unit and integration tests.
- Implement weather forecasts for upcoming days.
- Enhance UI with animations and better responsiveness.
- Add localization for multiple languages.

---

## Contributions 🤝

Contributions are welcome! Feel free to open an issue or submit a pull request.

---

## License 📄

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Enjoy the app? Give it a ⭐️ on [GitHub](https://github.com/your-username/weather_app)!
