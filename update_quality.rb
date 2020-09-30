require 'award'

def update_quality(awards)
  awards.each do |award|
    award.appreciate
    award.limit
    award.age
  end
end
