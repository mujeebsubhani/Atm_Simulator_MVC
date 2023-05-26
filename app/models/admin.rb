# frozen_string_literal: true

require 'csv'

class Admin

  def initialize
    @admin_database = "/home/pakwheels/Documents/Pakwheels/Atm_Simulator_MVC/app/databases/admin.csv"
  end

  def add_admin(name, id, pin)
    CSV.open(@admin_database, 'a') do |csv|
      csv << [name, id, pin]
    end
  end


  def get_admin_data

    admin_db = []
    CSV.foreach(@admin_database) do |row|
      admin_db.push({'name' => row[0], 'id' => row[1], 'pin' => row[2].to_i})
    end

    return admin_db

  end

end
