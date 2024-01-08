import 'package:intl/intl.dart'; // Import date formatting library
import 'package:flutter/material.dart'; // Import Flutter material library
import 'package:weather/weather.dart'; // Import weather library
import 'package:weatherapp/consts.dart'; // Import constants file

class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(key: key); // Constructor for HomePage widget

  @override
  State<HomePage> createState() =>
      _HomePageState(); // Create state for HomePage
}

class _HomePageState extends State<HomePage> {
  final WeatherFactory _wf =
      WeatherFactory(OPENWEATHER_API_KEY); // Create WeatherFactory instance
  Weather? _weather; // Store weather information

  @override
  void initState() {
    super.initState();

    // Fetch current weather data for "Bengaluru" using WeatherFactory
    _wf.currentWeatherByCityName("Bengaluru").then((w) {
      setState(() {
        _weather = w; // Update the state with fetched weather data
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey, // Set background color
        child: _buildUI(), // Display the main UI components
      ),
    );
  }

  // Function to build the UI components
  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
        child:
            CircularProgressIndicator(), // Display a loading indicator while fetching data
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _locationHeader(), // Display location header
          const SizedBox(height: 20),
          _dateTimeInfo(), // Display date and time information
          const SizedBox(height: 10),
          _weatherIcon(), // Display weather icon
          const SizedBox(height: 10),
          _currentTemp(), // Display current temperature
          const SizedBox(height: 10),
          _extraInfo(), // Display additional weather information
        ],
      ),
    );
  }

  // Function to display location header
  Widget _locationHeader() {
    return Text(_weather?.areaName ?? "",
        style: const TextStyle(
          color: Colors.white, // Set text color to white
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ));
  }

  // Function to display date and time information
  Widget _dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(DateFormat("h:mm a").format(now),
            style: const TextStyle(
              color: Colors.white, // Set text color to white
              fontSize: 35,
            )),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: const TextStyle(
                color: Colors.white, // Set text color to white
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              " ${DateFormat("d.M.y").format(now)}",
              style: const TextStyle(
                color: Colors.white, // Set text color to white
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }

  // Function to display weather icon
  Widget _weatherIcon() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"),
            ),
          ),
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: const TextStyle(
            color: Colors.white, // Set text color to white
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  // Function to display current temperature
  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
      style: const TextStyle(
        color: Colors.white, // Set text color to white
        fontSize: 90,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  // Function to display additional weather information
  Widget _extraInfo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent, // Set background color
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Add a subtle shadow
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Max:${_weather?.tempMax?.celsius?.toStringAsFixed(0)}° C",
                style: const TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 15,
                ),
              ),
              Text(
                "Min:${_weather?.tempMin?.celsius?.toStringAsFixed(0)}° C",
                style: const TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Wind:${_weather?.windSpeed?.toStringAsFixed(0)}m/s",
                style: const TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 15,
                ),
              ),
              Text(
                "Humidity:${_weather?.humidity?.toStringAsFixed(0)}%", // Display humidity with percentage
                style: const TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
