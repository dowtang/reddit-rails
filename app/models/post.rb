class Post < ActiveRecord::Base
  belongs_to :user
  # validates :column_name,
  
  has_many :comments
  has_many :post_votes

  # regex = regular expression
  URL_REGEX = /https?:\/\/[\S]+/

  validates :title, :length => {minimum: 1, maximum: 140 }
  validates :url, :length => {minimum: 1, maximum: 2083 }

  # validate :spam_free
  # validate :post_count

private

# def post_count
#     count = Post.count
#     if count > 2
#       self.errors.add(:base, "Cannot post more than 20 posts")
#       self.errors.add(:base, "cat")
#     end
#   end

def spam_free
  # order all the posts reverse chronologically
  # the latest post
  # get the posted time for the latest post
  last_post = Post.order(:created_at).last 
  # latest_time = last_post.created_at

  #goal: the user can only post after 1 minutes
  if Post.any? and last_post.created_at > 1.minute.ago
      # if this is true, the last post was made in less 1 minutes ago so please raise an error
      self.errors.add(:base, "You Robot Asshole, I have stopped you from posting new posts within 1 minute")

      # def limit_posts

    end
  end
end
