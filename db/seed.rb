10.times do 
    User.create([{
        username: Faker::Internet.username,
        email: Faker::Internet.safe_email,
        password: 'password'
    }])
end 

30.times do 
    Recipe.create([{
        content: Faker::Restaurant.description,
        name: Faker::Dessert.variety
    }])
end 