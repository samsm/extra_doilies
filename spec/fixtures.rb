require "pry-debugger"
require "active_model"
module Fixtures
  def name
    :name
  end

  def options
    {}
  end

  def test_object_class(accessor = :name)
    @test_object_class ||= Struct.new(accessor) do
      extend ActiveModel::Naming
      def self.name
        "TestObject"
      end
    end
  end

  def object
    @object ||= test_object_class.new "test name"
  end

  def view
    require 'action_dispatch/routing/polymorphic_routes'
    @view_model ||= Class.new do
      include ActionView::Helpers::UrlHelper
      include ActionView::RoutingUrlFor
      include ActionDispatch::Routing::PolymorphicRoutes
      def test_object_path(*args)
        obj = args.first
        "/#{obj.send(obj.members.first)}"
      end
    end
    @view ||= @view_model.new
  end

  def table
    Object.new
  end
end
