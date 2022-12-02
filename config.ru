require "rack"
require "middleman/rack"
require "rack/contrib/try_static"
require "rack/rewrite"

# Build the static site when the app boots
`bundle exec middleman build`

# Enable proper HEAD responses
use Rack::Head

# Redirect old URLs
use Rack::Rewrite do
  r301 '/policies.html',    '/policies'
  r301 '/press.html',       '/press'
  r301 '/sponsors.html',    '/sponsors'
  r301 '/sponsorship.html', '/sponsorship'
  r301 '/travel.html',      '/travel'
end

# Attempt to serve static HTML files
use Rack::TryStatic,
    :root => "build",
    :urls => %w[/],
    :try => ['.html', 'index.html', '/index.html']

# Serve a 404 page if all else fails
run lambda { |env|
  [
    404,
    {
      "Content-Type"  => "text/html",
      "Cache-Control" => "public, max-age=60"
    },
    File.open("build/404/index.html", File::RDONLY)
  ]
}
