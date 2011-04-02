class AddCpfToParticipante < ActiveRecord::Migration
  def self.up
    add_column :participantes, :cpf, :string
  end

  def self.down
    remove_column :participantes, :cpf
  end
end
