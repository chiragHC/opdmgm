class Patient < ActiveRecord::Base
  extend Enumerize

  enumerize :gender, in: {male: 0, female: 1, unspecified: 2}, default: 'male'
end
