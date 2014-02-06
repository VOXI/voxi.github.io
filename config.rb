###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Directory Indexes
activate :directory_indexes

# Methods defined in the helpers block are available in templates
helpers do
  def splash_path(image)
    return asset_path(:images, "/images/homepage-background/#{image}")
  end
end
set :build_dir, "tmp"

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Needed for non-root level deployment
# set :relative_links, true

# Build-specific configuration
configure :build do
  # Autoprefix CSS
  activate :autoprefixer

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true

  # Optional Settings
  # deploy.remote = "custom-remote" # remote name or git url, default: origin
  deploy.branch = "master" # default: gh-pages
end

# Reload the browser automatically whenever files change
activate :livereload