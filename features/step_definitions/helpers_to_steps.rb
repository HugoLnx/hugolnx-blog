FIXTURES_FOLDER = "spec/fixtures"

require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end

module MyWebHelpers
  def image_selector_for(image)
    "img[src='#{image}']"
  end
end

module FixturesHelpers
  def read_fixture(fixture_filename)
    File.read(File.join(FIXTURES_FOLDER, fixture_filename))
  end
end

module TextFixturesHelpers
  def text_with(qnt)
    @full_text = read_fixture "lerolero.txt"
    @qnt = qnt.to_i
    self
  end

  def characters
    @full_text[0..@qnt]
  end
end

World(WithinHelpers)
World(MyWebHelpers)
World(FixturesHelpers)
World(TextFixturesHelpers)
