class AddSalutationTitleToPerson < ActiveRecord::Migration[6.0]
  def change
    if not ActiveRecord::Base.connection.column_exists?(:people, :title)
      add_column :people, :title, :string, null: true
    end
    if not ActiveRecord::Base.connection.column_exists?(:people, :salutation)
      add_column :people, :salutation, :string, null: true
    end
    Person.reset_column_information
  end
end
