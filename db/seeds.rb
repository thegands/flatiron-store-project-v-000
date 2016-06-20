10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

User.create(email: 'test@test.com', password: 'testtest')
@user = User.first
@user.current_cart = @user.carts.create
@current_cart = @user.current_cart
@first_item = Item.first
@first_item.line_items.create(quantity: 1, cart: @user.current_cart)
@second_item = Item.second
@second_line_item = @second_item.line_items.create(quantity: 1, cart: @user.current_cart)
