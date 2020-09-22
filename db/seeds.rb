40.times do 
    User.create([{
        username: Faker::Internet.username,
        email: Faker::Internet.safe_email,
        password: 'password'
    }])
end 

30.times do 
    Recipe.create([{
        content: Faker::Food.description,
        name: Faker::Food.dish, 
        user_id: rand(1..10), 
        ingredient_id: rand(1..70)
    }])
end

70.times do
    Ingredient.create([{
        name: Faker::Food.ingredient,
        calories: rand(1..700),
        fats: rand(1..10),
        protein: rand(1..10),
        carbohydrates: rand(1..10)
    }])
end 

