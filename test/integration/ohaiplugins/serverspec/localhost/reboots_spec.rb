# Encoding: utf-8
require 'spec_helper'

reboots = OHAI['reboots']

describe 'Reboots Plugin' do

  it 'should be an array' do
      expect(reboots).to be_a(Array)
  end

  it 'should have a value' do
    expect(reboots.keys).not_to be_empty
  end
end

