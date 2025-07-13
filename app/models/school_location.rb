class SchoolLocation < ApplicationRecord
  belongs_to :school
  belongs_to :location
end
