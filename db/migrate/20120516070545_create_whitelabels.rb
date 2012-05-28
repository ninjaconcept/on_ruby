class CreateWhitelabels < ActiveRecord::Migration
  def change
    create_table :whitelabels do |t|
      t.string :name
      t.string :tagline
      t.string :subdomain

      t.timestamps
    end

    add_index :whitelabels, :subdomain, unique: true

    Whitelabel.create!(name: "Hamburg on Ruby", tagline: "Heimathafen der Hamburger Ruby Community", subdomain: "hamburg")
  end
end
