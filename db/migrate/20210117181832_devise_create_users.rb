class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      # Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      # Token
      t.string :authentication_token

      # Omniauth
      t.string :provider, null: false, default: "email"
      t.string :uid,      null: false, default: ""

      # Attributes
      t.string :name, null: false, default: ""
      t.string :avatar
      t.datetime :birth_date

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :authentication_token, unique: true
  end
end
