class MobilePhone

  attr_reader :credit, :power

  def initialize(credit, power)
    @credit = credit
    @power = power
  end

  def decrease_credit(credit_to_decrease_by)
    @credit -= credit_to_decrease_by
  end

  def decrease_power(power_to_decrease_by)
    @power -= power_to_decrease_by
  end

  def increase_credit(credit_to_increase_by)
    @credit += credit_to_increase_by
  end

  def increase_power(power_to_increase_by)
    @power += power_to_increase_by
  end

  def charge(charge_time)
    return "Phone fully charged" if @power == 100
    charge_amount = charge_time / 2
    total_power = increase_power(charge_amount)
    @power = 100 if charge_amount + total_power > 100  
  end

  def top_up(top_up_amount)
    @credit += top_up_amount
  end

  def call(length_of_call)
    return "You have 0 power, please charge phone" if @power == 0
    return "You have 0 credit, please top up" if @credit == 0


    power_to_decrease_by = length_of_call * 3
    credit_to_decrease_by = length_of_call / 4

    return :low_credit_and_power if power_to_decrease_by > @power && credit_to_decrease_by > @credit

    return :low_power if power_to_decrease_by > @power
    return :low_credit if credit_to_decrease_by > @credit

    power_after_call = decrease_power(power_to_decrease_by)
    credit_after_call = decrease_credit(credit_to_decrease_by)
    return :call_successful

  end

end