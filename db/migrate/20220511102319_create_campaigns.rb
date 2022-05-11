class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :sector
      t.string :country
      t.float :amount

      t.timestamps
    end
  end
end
