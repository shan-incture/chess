# frozen_string_literal: true
class Initiator

  VALID_COMMANDS = %w[place move left right report]

  def self.run_command(args)
    return "Please pass at least 1 valid argument" unless args.present?
    arguments_array = args.scan(/\w+/) if args
    begin
      return "This is not valid command, Please refer the documentation for valid argument" unless validate_arguments(arguments_array)
      process_arguments(arguments_array)
    rescue Exception => e
      Rails.logger.error(e.message)
      return "OOPS something went wrong, Please check logs for more information"
    end
  end

  def self.process_arguments(arguments_array)
    command = arguments_array[0].downcase
    case arguments_array.length
    when 5 then place_piece(arguments_array)
    when 2 then move_piece(arguments_array[1].to_i)
    when 1 then execute_command(command)
    else
      return 'Please pass valid arguments'
    end
  end

  def self.validate_arguments(array)
    command = array[0].downcase
    return false unless valid_command(command)
    if command == 'place' && array.length == 5
      return true
    elsif command == 'move' && array.length == 2
      return true
    elsif %w[left right report move].include?(command) && array.length == 1
      return true
    end
    false
  end

  def self.execute_command(command)
    instance = Pawn.instance
    return 'Please place the pawn on the board first' unless instance.x.present?
    instance.send(command.downcase.to_sym)
  end

  def self.move_piece(moves = 1)
    instance = Pawn.instance
    return 'Please place the pawn on the board first' unless instance.x.present?
    return 'A pawn can only move by a maximum of 2 tiles' unless moves > 0 || moves < 3
    instance.move(moves)

  end

  def self.place_piece(arguments_array)
    x, y, facing, color = parse_arguments(arguments_array)
    instance = Pawn.instance
    instance.place(x, y, facing, color)
    unless instance.valid?
      instance.reset_instance
      return "Not Placed"
    end
  end

  def self.valid_command(command)
    VALID_COMMANDS.include?(command)
  end

  def self.parse_arguments(arguments_array)
    x = arguments_array[1].to_i
    y = arguments_array[2].to_i
    facing = arguments_array[3]
    color = arguments_array[4]
    return x, y, facing, color
  end

end
