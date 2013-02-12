require File.dirname(__FILE__) + '/test_helper'
require "controller"

class TestController < Controller
  before_filter :one
  before_filter :two

  def initialize(out)
    @out = out
  end

  def one
    @out << :one
  end

  def two
    @out << :two
  end

  def index
    @out << :index
  end
end

class FiltersTest < Test::Unit::TestCase
  def test_store_filters
    assert_equal [:one, :two], TestController.before_filters
  end

  def test_filtering
    out = []
    TestController.new(out).process(:index)
    assert_equal [:one, :two, :index], out
  end
end
