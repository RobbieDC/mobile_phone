require_relative("./mobile")

class MobileRunner

  def initialize(mobile)
    @mobile = mobile
  end

  def start_mobile
    while( @mobile.power != 0 ) do
      gets
      run_mobile()
    end
  end

  def run_mobile
    puts "\n"
    puts "#{@mobile.power}\% battery"
    if @mobile.power >= 5
      puts "              .:'
            __ :'__
         .'`__`-'__``.
        :__________.-'
        :_________:
         :_________`-;
          `.__.-.__.' "
      puts "\n"
    elsif @mobile.power < 5
      puts "              .:'
            __ :'__
         .'`__`-'__``.
        :__________.-'
Battery critically low, please charge
         :_________`-;
          `.__.-.__.' "
      puts "\n"
    end

    puts "Siri: What Can I help you with?"
    puts "Enter 1 to check your credit"
    puts "Enter 2 to make a call"
    puts "Enter 3 to play Pokemon GO"
    puts "Enter 4 to charge phone"
    puts "Enter 5 to turn off phone"
    puts "\n"
    user_input = gets.chomp.to_i

    case user_input
    when 1
      puts "Credit remaining: £#{@mobile.credit}"

    when 2
      puts "How many minutes will your call last?"

      call_length = gets.chomp.to_i
      
      call_feedback = @mobile.call(call_length)
      case call_feedback
      when :low_credit_and_power
        puts "Not enough credit or power"
      when :low_credit
        puts "Not enough credit"
      when :low_power
        puts "Not enough power"
      when :call_successful
        puts "Ring Ring..."
        puts "Call ended"
        puts "£#{@mobile.credit} remaining"
      end

    when 3
      puts "Our servers are humbled by your incredible response."
      puts "We are working to resolve the issue. Please try again soon!"

    when 4
      puts "How long would you like to charge your phone for?"
      charge_time = gets.chomp.to_i
      @mobile.charge(charge_time)
      puts "Charging..."

    when 5
      puts "Goodbye"
      abort
    end
  end

end

iphone = MobilePhone.new(30, 100)
runner = MobileRunner.new( iphone )
runner.start_mobile()