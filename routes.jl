using Genie.Router

#route("/") do
#  serve_static_file("welcome.html")
#end

using WeatherWatch.IndecesController
route("/", IndecesController.layout)

using WeatherWatch.AlertsController
route("/alerts", AlertsController.hello)
