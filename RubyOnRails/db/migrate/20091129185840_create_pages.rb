class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.column :title, :string
      t.column :permalink, :string
      t.column :body, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
    Page.create(:title => "TUNES Home",
                :permalink => "welcome-page",
                :body => "Welcome to TUNES")
  end

  def self.down
    drop_table :pages
  end
end
