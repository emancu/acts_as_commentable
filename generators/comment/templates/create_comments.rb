class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string      :title, :limit => 50, :default => ""
      t.text        :comment
      t.references  :commentable, :polymorphic => true
      t.references  :author,      :polymorphic => true
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
    add_index :comments, :author_id
    add_index :comments, :author_type
  end

  def self.down
    drop_table :comments
  end
end
