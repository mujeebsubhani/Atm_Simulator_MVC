# frozen_string_literal: true

require '/home/pakwheels/Documents/Pakwheels/Atm_Simulator_MVC/app/models/admin.rb'

class AdminController

  def initialize
    @ma_obj = Admin.new()
  end

  def verify_admin_controller(pin)

    for data in @ma_obj.get_admin_data
      if data['pin'] == pin
        return true
      end
    end

    return false
  end

  def find_data_controller(pin)
    for data in @ma_obj.get_admin_data
      if data['pin'] == pin
        return {'name' => data['name'], 'id' => data['id'], 'pin' => data['pin']}
      end
    end
  end

  def get_data_controller
    return @ma_obj.get_admin_data
  end

  def admin_add_controller(name, pin, id)
    @ma_obj.add_admin(name, pin, id)
  end

end
