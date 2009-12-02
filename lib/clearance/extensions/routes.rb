if defined?(ActionController::Routing::RouteSet)
  class ActionController::Routing::RouteSet
    def load_routes_with_clearance!
      lib_path = File.dirname(__FILE__)
      clearance_routes = File.join(lib_path, *%w[.. .. .. config clearance_routes.rb])
      
      configuration_files.delete(clearance_routes)
      add_configuration_file(clearance_routes)      

      load_routes_without_clearance!
    end

    alias_method_chain :load_routes!, :clearance
  end
end
