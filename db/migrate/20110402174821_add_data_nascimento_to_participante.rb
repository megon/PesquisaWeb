class AddDataNascimentoToParticipante < ActiveRecord::Migration
  def self.up
    add_column :participantes, :data_nascimento, :date
  end

  def self.down
    remove_column :participantes, :data_nascimento
  end
end
