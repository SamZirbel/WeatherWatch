module AlertsController

using Genie.Renderer.Html
using Genie.Renderer.Json
#using BenchmarkTools
using HTTP
using JSON


  rawWeatherAlerts = HTTP.get("https://api.weather.gov/alerts")
  weatherAlertsBody = rawWeatherAlerts.body
  weatherAlertsString = String(weatherAlertsBody)


  function hello()
    two()
    h1(two())
    [
#      two()
      getAlertNumber(1)
      h1() do
        "Gingerbread Rock Greendale"
      end
      h1() do
        "====="
      end
      h1() do
        String((HTTP.get("https://api.weather.gov/alerts")).body)
      end
      h2() do
        weatherAlertsString
      end
    ]
  end

  function two()
    println("Function 2 called")
    h1("Function2")
    [
      h1() do
        "Testing Function Two"
      end
    ]
  end

  function getAlertNumber(alertNum::Int)
    println("Starting Get First Alert Function")
    alertsJSON = JSON.parse(weatherAlertsString)
    #print(alertsJSON["features"][1]["properties"])
    alertProperties = alertsJSON["features"][alertNum]["properties"]
    println("======")
    #print(alertProperties)
    println(keys(alertProperties))
    "done"
    [
      if haskey(alertProperties, "headline")
        h1() do
#          "Has Headline"
#          println(alertProperties["headline"])
          if alertProperties["headline"] == nothing
            "Headline Was Empty"
          else
            alertProperties["headline"]
          end
        end
      end
      h1() do
        alertProperties["category"]
      end
      a(href=String(alertProperties["@id"])) do
        "Raw Data For Headline : ",alertProperties["@id"]
      end
    ]
  end

end
