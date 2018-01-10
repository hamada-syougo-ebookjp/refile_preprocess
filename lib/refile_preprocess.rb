module RefilePreprocess
  require 'refile_preprocess/app'

  if defined?(Rails)
    require 'refile_preprocess/preprocess_attachment'
    require 'refile_preprocess/railtie'
  end
end
