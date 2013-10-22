module Spree
  class Author < ActiveRecord::Base
#    has_many :posts, class_name: "Blog::Post", inverse_of: :author

    validates :first_name, :last_name, :bio, :permalink, presence: true
    scope :sorted_alphabetically, -> { order('first_name, last_name') }
    attr_accessible :first_name, :last_name, :permalink, :bio

    make_permalink order: :first_name, field: :permalink

    def full_name
      [ first_name, last_name ].join(" ")
    end

    def to_param
      self.full_name.to_s.to_url
    end

  end
end
