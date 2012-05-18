class CreateWhitelabels < ActiveRecord::Migration
  def change
    create_table :whitelabels do |t|
      t.string :name
      t.string :tagline
      t.string :subdomain

      t.timestamps
    end
  end
end
