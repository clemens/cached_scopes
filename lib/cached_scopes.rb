require 'cached_scopes/railtie'

module CachedScopes
  module ClassMethods
    def cached_scope(name, *args)
      cache_key = :"#{self.name.tableize}_#{name}"
      cache_options[cache_key] = args.extract_options!

      scope(:"uncached_#{name}", *args)

      singleton_class.class_eval <<-CODE, __FILE__, __LINE__
        def #{name}
          scope = nil # no need to fetch things twice

          ids = Rails.cache.fetch("active_record.cached_#{cache_key}_ids", cache_options[#{cache_key.inspect}]) do
            scope = uncached_#{name}
            scope.map(&:id).join(',')
          end || 'NULL'

          scope || where("\#{table_name}.id IN (\#{ids})")
        end
      CODE
    end
  end
end
