require 'activerecord'

# ActsAsAuthorComment
module Juixe
  module Acts #:nodoc:
    module AuthorComment #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_author_comment(options={})
          has_many :comments, {:as => :author, :dependent => :destroy}.merge(options)
          include Juixe::Acts::AuthorComment::InstanceMethods
          extend Juixe::Acts::AuthorComment::SingletonMethods
        end
      end

      # This module contains class methods
      module SingletonMethods
        # Helper method to lookup for comments for a given object.
        # This method is equivalent to obj.comments.
        def find_comments_for(obj)
          author_comment = ActiveRecord::Base.send(:class_name_of_active_record_descendant, self).to_s

          Comment.find(:all,
            :conditions => ["author_id = ? and author_type = ?", obj.id, author_comment.class.name],
            :order => "created_at DESC"
          )
        end
      end

      # This module contains instance methods
      module InstanceMethods
        # Helper method to sort comments by date
        def comments_ordered_by_submitted
          Comment.find(:all,
            :conditions => ["author_id = ? and author_type = ?", id, self.class.name],
            :order => "created_at DESC"
          )
        end

        # Helper method that defaults the submitted time.
        def add_comment(comment)
          comments << comment
        end
      end

    end
  end
end

ActiveRecord::Base.send(:include, Juixe::Acts::AuthorComment)
