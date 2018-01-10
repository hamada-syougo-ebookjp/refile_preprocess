require_relative 'preprocess_attachment.rb'

module RefilePreprocess
  class Railtie < Rails::Railtie
    initializer 'refile_preprocess.setup', after: 'refile.setup' do
      ActiveSupport.on_load :active_record do
        ::ActiveRecord::Base.extend(RefilePreprocess::PreprocessAttachment)
      end

      ::Refile::App.prepend(RefilePreprocess::App)
    end
  end
end
