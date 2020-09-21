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
        name: Faker::Food.dish
    }])
end

70.times do
    Ingredient.create([{
        name: Faker::Food.ingredient,
        calories: Faker::Number.between(from: 1, to: 700),
        fats: Faker::Number.between(from: 1, to: 10),
        protein: Faker::Number.between(from: 1, to: 10),
        carbohydrates: Faker::Number.between(from: 1, to: 10)
    }])
end 

