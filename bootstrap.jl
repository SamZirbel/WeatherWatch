(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using WeatherWatch
const UserApp = WeatherWatch
WeatherWatch.main()
