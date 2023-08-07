require 'rails_helper'

describe Initiator do

  context "with valid arguments" do

    it 'take returns an error message when empty argument list' do
      x = Initiator.run_command(' ')
      expect(x).to eq('Please pass at least 1 valid argument')
    end

    it 'take returns an error message when empty argument list' do
      x = Initiator.run_command(' random value 1 2 3')
      expect(x).to eq('This is not valid command, Please refer the documentation for valid argument')
    end

  end

  context "Works with the place command" do
    it 'takes the place command and places the object' do
      Initiator.run_command('PLACE 0,0,NORTH,WHITE')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,0,NORTH,WHITE')
    end

    it 'takes the place command and returns error message when not placed' do
      response = Initiator.run_command('PLACE 8,8,NORTH,WHITE')
      expect(response).to eq('Not Placed')
    end

  end

  context "Turning the pawn Left or Right" do
    it 'turns the the pawn facing to the left' do
      Initiator.run_command('PLACE 0,0,NORTH,WHITE')
      Initiator.run_command('LEFT')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,0,WEST,WHITE')
    end

    it 'turns the the pawn facing to the left' do
      Initiator.run_command('PLACE 0,0,NORTH,WHITE')
      Initiator.run_command('RIGHT')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,0,EAST,WHITE')
    end
  end

  context "Moving the pawn as per instruction" do

    it 'moves the Pawn forward by 1' do
      Initiator.run_command('PLACE 0,0,NORTH,WHITE')
      Initiator.run_command('MOVE')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,1,NORTH,WHITE')
    end

    it 'moves the Pawn forward by 2' do
      Initiator.run_command('PLACE 0,0,NORTH,WHITE')
      Initiator.run_command('MOVE 2')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,2,NORTH,WHITE')
    end

    it 'moves the Pawn forward turns and comes back to original position' do
      Initiator.run_command('PLACE 0,0,NORTH,WHITE')
      Initiator.run_command('MOVE')
      Initiator.run_command('LEFT')
      Initiator.run_command('LEFT')
      Initiator.run_command('MOVE')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,0,SOUTH,WHITE')
    end

    it 'does not fall off the board' do
      Initiator.run_command('PLACE 0,0,SOUTH,WHITE')
      Initiator.run_command('MOVE')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,0,SOUTH,WHITE')
    end

    it 'does not fall off the board' do
      Initiator.run_command('PLACE 7,7,NORTH,WHITE')
      Initiator.run_command('MOVE')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('7,7,NORTH,WHITE')
    end

  end

  context "The test cases given with the problem statement" do

    it 'takes the place command and places the object' do
      Initiator.run_command('PLACE 0,0,NORTH,WHITE')
      Initiator.run_command('MOVE 1')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,1,NORTH,WHITE')
    end

    it 'takes the place command and places the object' do
      Initiator.run_command('PLACE 0,0,NORTH,BLACK')
      Initiator.run_command('LEFT')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('0,0,WEST,BLACK')
    end

    it 'takes the place command and places the object' do
      Initiator.run_command('PLACE 1,2,EAST,BLACK')
      Initiator.run_command('MOVE 2')
      Initiator.run_command('MOVE 1')
      Initiator.run_command('LEFT')
      Initiator.run_command('MOVE')
      report = Initiator.run_command('REPORT')
      expect(report).to eq('4,3,NORTH,BLACK')
    end
  end
end