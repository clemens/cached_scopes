module CachedScopes
  class Railtie < Rails::Railtie
    initializer 'cached_scopes.active_record_install' do
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.instance_eval do
          class_inheritable_hash :cache_options
          self.cache_options = {}
          extend CachedScopes::ClassMethods
        end
      end
    end
  end
end