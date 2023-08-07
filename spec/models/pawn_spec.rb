require 'rails_helper'

describe Pawn do
  it "should be valid with valid attributes" do
    pawn = Pawn.instance.place(1,2,"NORTH","WHITE")
    expect(pawn).to be_valid
  end

  it "should not be valid with invalid attributes" do
    pawn = Pawn.instance.place(8,2,"NORTH","WHITE")
    expect(pawn).not_to be_valid
  end

  it "should be able to move" do
    pawn = Pawn.instance.place(1,2,"NORTH","WHITE")
    pawn.move(1)
    expect(pawn.y).to eq(3)
  end

  it "should be able to turn left" do
    pawn = Pawn.instance.place(1,2,"NORTH","WHITE")
    pawn.left
    expect(pawn.facing).to eq("WEST")
  end

  it "should be able to turn right" do
    pawn =Pawn.instance.place(1,2,"NORTH","WHITE")
    pawn.right
    expect(pawn.facing).to eq("EAST")
  end

  it "should be able to report its position" do
    pawn = Pawn.instance.place(1,2,"NORTH","WHITE")
    expect(pawn.report).to eq("1,2,NORTH,WHITE")
  end
end