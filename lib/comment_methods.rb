module ActsAsCommentable
  # including this module into your Comment model will give you finders and named scopes
  # useful for working with Comments.
  # The named scopes are:
  #   in_order: Returns comments in the order they were created (created_at ASC).
  #   recent: Returns comments by how recently they were created (created_at DESC).
  #   limit(N): Return no more than N comments.
  module Comment

    def self.included(comment_model)
      comment_model.extend Finders
      comment_model.scope :in_order, comment_model.order('created_at ASC')
      comment_model.scope :recent,   comment_model.order('created_at DESC')
    end

    module Finders
      # Helper class method to lookup all comments assigned
      # to all commentable types for a given author.
      def find_comments_by_user(author)
        where(["author_id = ? AND author_type = ?", author.id, author.class]).order("created_at DESC")
      end

      # Helper class method to look up all comments for
      # commentable class name and commentable id.
      def find_comments_for_commentable(commentable_str, commentable_id)
        where(["commentable_type = ? and commentable_id = ?", commentable_str, commentable_id]).order("created_at DESC")
      end

      # Helper class method to look up a commentable object
      # given the commentable class name and id
      # TODO: look if its better to implement with commentable object
      def find_commentable(commentable_str, commentable_id)
        commentable_str.constantize.find(commentable_id)
      end
    end
  end
end
