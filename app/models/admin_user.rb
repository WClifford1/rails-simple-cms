class AdminUser < ApplicationRecord

    # self.table_name = "admin_users"
    has_and_belongs_to_many :pages
    has_many :section_edits
    has_many :sections, :through  => :section_edits

    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    FORBIDDEN_USERNAMES = ["littlebopeep", "humptydumpty", "marymary"]

    # Short validations
    validates :first_name,  :presence => true,
                            :length => { :maximum => 25}

    validates :last_name,   :presence => true,
                            :length => { :maximum => 50}

    validates :username,    :presence => true,
                            :length => { :within => 8..25},
                            :uniqueness => true

    validates :email,       :presence => true,
                            :length => { :maximum => 100},
                            :format => EMAIL_REGEX,
                            :confirmation => true

    validate :username_is_allowed
    
    validate :no_new_users_on_sunday, :on => :create

    private
    # Custom validations
    def username_is_allowed
        if FORBIDDEN_USERNAMES.include?(username)
            errors.add(:username, "has been restricted from use")
        end
    end

    def no_new_users_on_sunday
        if Time.now.wday == 0
            errors.add(:base, "No new users on Sundays")
        end
    end

    # Long form validations
    # validates_presence_of :first_name
    # validates_length_of :first_name, :maximum => 25
    # validates_presence_of :last_name
    # validates_length_of :last_name, :maximum => 50
    # validates_presence_of :username
    # validates_length_of :first_name, :within => 8..25
    # validates_uniqueness_of :username
    # validates_presence_of :email
    # validates_length_of :email, :maximum => 100
    # validates_format_of :email, :with => EMAIL_REGEX
    # validates_confirmation_of :email

end
