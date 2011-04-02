class AddEmailToParticipante < ActiveRecord::Migration
  def self.up
    add_column :participantes, :email, :string
  end

  def self.down
    remove_column :participantes, :email
  end
end
