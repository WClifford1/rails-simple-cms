class SectionEdit < ApplicationRecord

    # Rich joining table

    belongs_to :admin_user
    belongs_to :section

end
