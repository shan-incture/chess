require 'rails_helper'

describe Pawn do
  context 'when the pawn is created' do
    it 'should have a x and y coordinate' do
      pawn = Pawn.new(0, 0, 'NORTH', 'WHITE')
      expect(pawn).to be_a(Pawn)
      expect(pawn.x).to eq(0)
      expect(pawn.y).to eq(0)
    end

    it 'should have a facing direction' do
      pawn = Pawn.new(0, 0, 'NORTH', 'WHITE')
      expect(pawn.facing).to eq('NORTH')
    end

    it 'should have a color' do
      pawn = Pawn.new(0, 0, 'NORTH', 'WHITE')
      expect(pawn.color).to eq('WHITE')
    end
  end
end