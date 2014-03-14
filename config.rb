###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
  config.line_comments = false
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'assets/css'

set :js_dir, 'assets/js'

set :images_dir, 'assets/img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Activate sync extension
activate :sync do |sync|
  sync.fog_provider = 'AWS' # Your storage provider
  sync.fog_directory = 'steelcityruby.org' # Your bucket name
  sync.fog_region = 'us-east-1' # The region your storage bucket is in (eg us-east-1, us-west-1, eu-west-1, ap-southeast-1 )
  sync.aws_access_key_id = 'AKIAI2RC6YLS3XUTORBA' # Your Amazon S3 access key
  sync.aws_secret_access_key = 'UYSQ3RbtDxDbqvbgBIVFvGv922/6mxBVRBiAJZA6' # Your Amazon S3 access secret
  sync.existing_remote_files = 'delete' # What to do with your existing remote files? ( keep or delete )
  # sync.gzip_compression = false # Automatically replace files with their equivalent gzip compressed version
  # sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote   = "gh-pages" # remote name or git url, default: origin
  # deploy.branch   = "master" # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
end
