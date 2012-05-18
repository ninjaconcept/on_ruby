class AddWhitelabelAssociations < ActiveRecord::Migration

  def change
    [:highlights, :jobs, :locations, :wishes].each do |table_name|
      add_whitelabel_association table_name
    end
  end

private

  def add_whitelabel_association(table_name)
    add_column table_name, :whitelabel_id, :integer, after: :id
    change_column table_name, :whitelabel_id, :integer, null: false
    add_index table_name, :whitelabel_id
  end

end
