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
      h1() do
        "Welcome To The Weather Watch Alerts Page"
      end
      h1() do
        "========================================"
      end
#      two()
      getAlertNumber(1)
      getAlertNumber(2)
      getAlertNumber(3)
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
      if haskey(alertProperties, "description")
        h2() do
          if alertProperties["description"] == nothing
            "Description Was Not Listed"
          else
            string("Alert Description : ", alertProperties["description"])
          end
        end
      end
      if haskey(alertProperties, "severity")
        h3() do
          if alertProperties["severity"] == nothing
            "Severity Was Not Listed"
          else
             string("Alert Severity : ", alertProperties["severity"])
          end
        end
      end
      if haskey(alertProperties, "category")
        h3() do
          if alertProperties["category"] == nothing
            "Category Was Not Listed"
          else
            string("Alert Category : ", alertProperties["category"])
          end
        end
      end
      if haskey(alertProperties, "@id")
        a(href=String(alertProperties["@id"])) do
          if alertProperties["@id"] == nothing
            "No Raw Data Link Was Provided For This Weather Alert"
          else
            string("Raw Data For Headline : ", alertProperties["@id"])
          end
        end
      end
      h2() do
        "--------------------------------------------"
      end
    ]
  end

end
