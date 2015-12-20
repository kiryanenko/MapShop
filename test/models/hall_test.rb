require 'test_helper'

class HallTest < ActiveSupport::TestCase
  test 'should not save string scale' do
    rec = Hall.new(scale: 'kgui')
    assert !rec.save
  end
end
