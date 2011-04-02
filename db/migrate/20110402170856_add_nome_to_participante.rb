class AddNomeToParticipante < ActiveRecord::Migration
  def self.up
    add_column :participantes, :nome, :string
  end

  def self.down
    remove_column :participantes, :nome
  end
end
