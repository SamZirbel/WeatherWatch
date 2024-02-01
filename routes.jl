using Genie.Router

route("/") do
  serve_static_file("welcome.html")
end

using WeatherWatch.AlertsController
route("/alerts", AlertsController.hello)
