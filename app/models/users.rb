# frozen_string_literal: true

class Users
  def initialize
    @user_database = "/home/pakwheels/Documents/Pakwheels/Atm_Simulator_MVC/app/databases/user.csv"
  end

  def withdraw_amount(amount, pin)

    n_name, n_id, n_pin, n_balance = nil

    user_db = get_user_data
    for data in user_db
      if data['pin'] == pin
        n_name = data['name']
        n_id = data['id']
        n_pin = data['pin']
        n_balance = data['balance']
        user_db.delete(data)
      end
    end

    File.delete(@user_database)

    if n_balance > amount
      n_balance = n_balance - amount
    else
      return "Low Balance"
    end

    user_db.push({'name' => n_name, 'id' => n_id, 'pin' => n_pin.to_i, 'balance' => n_balance.to_i})

    CSV.open(@user_database, 'w') do |csv|
      for data in user_db
        csv << [data['name'], data['id'], data['pin'], data['balance']]
      end
    end

    end

  def get_user_data

    user_db = []
    CSV.foreach(@user_database) do |row|
      user_db.push({'name' => row[0], 'id' => row[1], 'pin' => row[2].to_i, 'balance' => row[3].to_i})
    end

    return user_db
  end

end


