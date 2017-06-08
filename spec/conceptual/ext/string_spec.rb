require 'spec_helper'
require 'conceptual/ext/string'

RSpec.describe 'Conceptual::String' do

  describe('to_snake') do
    it 'converts PascalCase string to snake_case' do
      expect('IAmAHero'.to_snake).to eq 'i_am_a_hero'
    end

    it 'converts UPPER string to snake' do
      expect('ILiveInUSANow'.to_snake).to eq 'i_live_in_usa_now'
    end
  end

end
