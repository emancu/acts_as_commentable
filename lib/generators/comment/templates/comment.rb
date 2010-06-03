class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :author, :polymorphic => true
  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'
end
