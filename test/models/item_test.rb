require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test 'should not save string x' do
    rec = Item.new(x: 'kgui')
    assert !rec.save
  end

  test 'should not save string i' do
    rec = Item.new(y: 'kgui')
    assert !rec.save
  end
end
