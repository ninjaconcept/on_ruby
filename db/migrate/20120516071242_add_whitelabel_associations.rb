class AddWhitelabelAssociations < ActiveRecord::Migration

  def change
    [:events, :highlights, :jobs, :locations, :wishes].each do |table_name|
      add_whitelabel_association table_name
    end
  end

private

  def add_whitelabel_association(table_name)
    add_column table_name, :whitelabel_id, :integer, after: :id
    # Default to hamburg.onruby to allow existing data.
    # TODO: The default should probably be removed some day. [dh, 2012-05-28]
    change_column table_name, :whitelabel_id, :integer, null: false, default: 1
    add_index table_name, :whitelabel_id
  end

end
