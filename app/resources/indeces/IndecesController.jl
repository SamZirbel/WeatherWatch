module IndecesController

using Stipple
using StippleUI
using GenieFramework
using Genie.Renderer.Html
using Genie.Renderer.Json
using HTTP
using JSON

  function layout()
    [
      h1() do
        "Weather Watch"
      end
      h1() do
        "========================="
      end
      a(href="/alerts") do
        "To The Alerts Page"
      end
    ]
  end

end
