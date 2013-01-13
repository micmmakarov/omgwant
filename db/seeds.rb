#creating categories
categories = ['style', 'beauty', 'accessories']

categories.each do |c|
  category = Category.find_or_create_by_name(c)
  category.save!
end

categories = Category.all
ids = []

categories.each do |c|
  ids.push(c.id)
end

#gives random category to images
images = Image.all

images.each do |i|
  i.category_id = ids.sample
  i.save!
end

#users = [1, 2]
#images.each do |i|
#  i.user_id = users.sample
#  i.save!
#end
