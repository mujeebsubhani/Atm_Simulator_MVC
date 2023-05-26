# frozen_string_literal: true

require '/home/pakwheels/Documents/Pakwheels/Atm_Simulator_MVC/app/models/users.rb'


class UserController
  def initialize
    @mu_obj = Users.new()
  end

  def verify_user_controller(pin)

    for data in @mu_obj.get_user_data

      if data['pin'] == pin
        return true
      end
    end

    return false
  end

  def find_data_controller(pin)

    for data in @mu_obj.get_user_data
      if data['pin'] == pin

        return {'name' => data['name'], 'id' => data['id'], 'pin' => data['pin'], 'balance' => data['balance']}
      end
    end
  end

  def withdraw_controller(amount, pin)
    @mu_obj.withdraw_amount(amount,pin)
  end


end
