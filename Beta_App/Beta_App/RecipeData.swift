//
//  RecipeData.swift
//  Beta_App
//
//  Created by Haniel Tsegay on 10/23/24.
//

import Foundation

// Keto Recipes
let ketoRecipes: [Recipe] = [
    Recipe(
        name: "Keto Avocado Salad",
        ingredients: [
            "1 avocado, diced",
            "2 cups baby spinach",
            "1/4 cup feta cheese, crumbled",
            "2 tbsp olive oil",
            "1 tbsp lemon juice",
            "Salt and pepper to taste"
        ],
        directions: [
            "In a bowl, combine diced avocado and baby spinach.",
            "Sprinkle feta cheese over the salad.",
            "In a small bowl, whisk together olive oil, lemon juice, salt, and pepper.",
            "Drizzle the dressing over the salad.",
            "Toss gently and serve immediately."
        ]
    ),
    Recipe(
        name: "Creamy Garlic Shrimp",
        ingredients: [
            "1 lb large shrimp, peeled and deveined",
            "2 tbsp butter",
            "4 cloves garlic, minced",
            "1/2 cup heavy cream",
            "1/4 cup grated Parmesan cheese",
            "1 tbsp fresh parsley, chopped",
            "Salt and pepper to taste"
        ],
        directions: [
            "Melt butter in a skillet over medium heat.",
            "Add garlic and sauté until fragrant.",
            "Add shrimp and cook until pink, about 2-3 minutes per side.",
            "Pour in heavy cream and bring to a simmer.",
            "Stir in Parmesan cheese until melted.",
            "Season with salt and pepper.",
            "Garnish with parsley and serve."
        ]
    ),
    Recipe(
        name: "Keto Chicken Alfredo",
        ingredients: [
            "2 chicken breasts, sliced",
            "2 tbsp olive oil",
            "1 cup broccoli florets",
            "1 cup heavy cream",
            "1/2 cup grated Parmesan cheese",
            "2 cloves garlic, minced",
            "Salt and pepper to taste"
        ],
        directions: [
            "Heat olive oil in a skillet over medium heat.",
            "Add chicken slices and cook until browned.",
            "Add garlic and sauté for 1 minute.",
            "Add broccoli and cook until tender.",
            "Pour in heavy cream and bring to a simmer.",
            "Stir in Parmesan cheese until sauce thickens.",
            "Season with salt and pepper.",
            "Serve over zucchini noodles or alone."
        ]
    ),
    Recipe(
        name: "Keto Egg Muffins",
        ingredients: [
            "6 large eggs",
            "1/2 cup spinach, chopped",
            "1/4 cup bell pepper, diced",
            "1/4 cup shredded cheddar cheese",
            "Salt and pepper to taste",
            "Cooking spray"
        ],
        directions: [
            "Preheat oven to 375°F (190°C).",
            "Spray a muffin tin with cooking spray.",
            "In a bowl, whisk eggs and add spinach, bell pepper, cheese, salt, and pepper.",
            "Pour the mixture evenly into the muffin cups.",
            "Bake for 20-25 minutes until set.",
            "Let cool slightly before removing from the tin.",
            "Serve warm."
        ]
    ),
    Recipe(
        name: "Keto Bacon Wrapped Asparagus",
        ingredients: [
            "1 bunch asparagus, trimmed",
            "8 slices bacon",
            "1 tbsp olive oil",
            "Salt and pepper to taste"
        ],
        directions: [
            "Preheat oven to 400°F (200°C).",
            "Wrap each asparagus spear with a slice of bacon.",
            "Place on a baking sheet lined with parchment paper.",
            "Drizzle with olive oil and season with salt and pepper.",
            "Bake for 15-20 minutes until bacon is crispy.",
            "Serve immediately."
        ]
    ),
    Recipe(
        name: "Keto Zucchini Noodles with Pesto",
        ingredients: [
            "2 large zucchinis",
            "1/2 cup basil pesto",
            "1 tbsp olive oil",
            "Cherry tomatoes for garnish",
            "Salt and pepper to taste"
        ],
        directions: [
            "Use a spiralizer to make zucchini noodles.",
            "Heat olive oil in a skillet over medium heat.",
            "Add zucchini noodles and sauté for 2-3 minutes.",
            "Stir in pesto sauce until well combined.",
            "Season with salt and pepper.",
            "Garnish with cherry tomatoes.",
            "Serve immediately."
        ]
    ),
    Recipe(
        name: "Keto Cauliflower Rice",
        ingredients: [
            "1 head cauliflower",
            "2 tbsp butter",
            "1 clove garlic, minced",
            "Salt and pepper to taste",
            "Chopped parsley for garnish"
        ],
        directions: [
            "Grate cauliflower to make 'rice'.",
            "Heat butter in a skillet over medium heat.",
            "Add garlic and sauté for 1 minute.",
            "Add cauliflower rice and cook for 5-7 minutes.",
            "Season with salt and pepper.",
            "Garnish with chopped parsley.",
            "Serve as a side dish."
        ]
    ),
    Recipe(
        name: "Keto Fat Bombs",
        ingredients: [
            "1/2 cup coconut oil",
            "1/2 cup peanut butter",
            "1/4 cup unsweetened cocoa powder",
            "1/4 cup stevia or keto-friendly sweetener",
            "1 tsp vanilla extract"
        ],
        directions: [
            "Melt coconut oil and peanut butter together over low heat.",
            "Stir in cocoa powder, sweetener, and vanilla extract.",
            "Pour mixture into silicone molds or mini muffin tins.",
            "Freeze for at least 1 hour.",
            "Pop out of molds and store in the freezer.",
            "Enjoy as a keto-friendly snack."
        ]
    ),
    Recipe(
        name: "Keto Cheeseburger Lettuce Wraps",
        ingredients: [
            "1 lb ground beef",
            "1/2 onion, chopped",
            "1 tbsp olive oil",
            "8 large lettuce leaves",
            "1 tomato, sliced",
            "Cheddar cheese slices",
            "Mustard and mayo"
        ],
        directions: [
            "Heat olive oil in a skillet over medium heat.",
            "Add onion and sauté until translucent.",
            "Add ground beef and cook until browned.",
            "Season with salt and pepper.",
            "Assemble wraps using lettuce leaves as 'buns'.",
            "Add beef, cheese, tomato, mustard, and mayo.",
            "Wrap tightly and serve."
        ]
    ),
    Recipe(
        name: "Keto Chocolate Mousse",
        ingredients: [
            "1 cup heavy whipping cream",
            "3 tbsp unsweetened cocoa powder",
            "2 tbsp stevia or keto-friendly sweetener",
            "1 tsp vanilla extract",
            "Fresh berries for garnish"
        ],
        directions: [
            "In a mixing bowl, combine heavy cream, cocoa powder, sweetener, and vanilla extract.",
            "Whip with an electric mixer until stiff peaks form.",
            "Spoon into serving dishes.",
            "Refrigerate for at least 1 hour.",
            "Garnish with fresh berries before serving."
        ]
    )
]

// High Protein Recipes
let highProteinRecipes: [Recipe] = [
    Recipe(
        name: "Grilled Chicken Breast",
        ingredients: [
            "2 chicken breasts",
            "1 tbsp olive oil",
            "1 tsp garlic powder",
            "1 tsp paprika",
            "Salt and pepper to taste"
        ],
        directions: [
            "Preheat grill to medium-high heat.",
            "In a small bowl, mix garlic powder, paprika, salt, and pepper.",
            "Brush chicken breasts with olive oil.",
            "Rub the spice mixture onto the chicken.",
            "Grill chicken for 6-8 minutes per side.",
            "Let rest for 5 minutes before slicing.",
            "Serve with steamed vegetables."
        ]
    ),
    Recipe(
        name: "Beef and Broccoli Stir-Fry",
        ingredients: [
            "1 lb flank steak, sliced thinly",
            "2 cups broccoli florets",
            "2 tbsp soy sauce",
            "1 tbsp cornstarch",
            "1 tbsp sesame oil",
            "1 tsp minced ginger",
            "2 cloves garlic, minced"
        ],
        directions: [
            "In a bowl, mix beef with cornstarch and soy sauce.",
            "Heat sesame oil in a wok over high heat.",
            "Add ginger and garlic, sauté for 30 seconds.",
            "Add beef and stir-fry until browned.",
            "Add broccoli and cook for 3-4 minutes.",
            "Add a splash of water if needed.",
            "Serve over brown rice."
        ]
    ),
    Recipe(
        name: "Baked Salmon with Lemon",
        ingredients: [
            "2 salmon fillets",
            "2 tbsp olive oil",
            "1 lemon, sliced",
            "2 cloves garlic, minced",
            "Salt and pepper to taste",
            "Fresh dill for garnish"
        ],
        directions: [
            "Preheat oven to 400°F (200°C).",
            "Place salmon on a baking sheet lined with foil.",
            "Drizzle with olive oil and top with garlic.",
            "Season with salt and pepper.",
            "Place lemon slices on top.",
            "Bake for 12-15 minutes.",
            "Garnish with fresh dill and serve."
        ]
    ),
    Recipe(
        name: "Turkey Meatballs",
        ingredients: [
            "1 lb ground turkey",
            "1/2 cup breadcrumbs",
            "1 egg",
            "1/4 cup grated Parmesan cheese",
            "2 cloves garlic, minced",
            "1 tbsp fresh parsley, chopped",
            "Salt and pepper to taste"
        ],
        directions: [
            "Preheat oven to 375°F (190°C).",
            "In a bowl, combine all ingredients.",
            "Mix well and form into meatballs.",
            "Place on a baking sheet lined with parchment paper.",
            "Bake for 20-25 minutes until cooked through.",
            "Serve with marinara sauce."
        ]
    ),
    Recipe(
        name: "Protein Smoothie",
        ingredients: [
            "1 scoop protein powder",
            "1 banana",
            "1 cup almond milk",
            "1 tbsp peanut butter",
            "Ice cubes"
        ],
        directions: [
            "Combine all ingredients in a blender.",
            "Blend until smooth.",
            "Pour into a glass and enjoy immediately."
        ]
    ),
    Recipe(
        name: "Quinoa Salad with Chickpeas",
        ingredients: [
            "1 cup quinoa, cooked",
            "1 can chickpeas, drained",
            "1 cucumber, diced",
            "1/2 red onion, chopped",
            "2 tbsp olive oil",
            "2 tbsp lemon juice",
            "Salt and pepper to taste"
        ],
        directions: [
            "In a large bowl, combine quinoa, chickpeas, cucumber, and red onion.",
            "In a small bowl, whisk olive oil, lemon juice, salt, and pepper.",
            "Pour dressing over the salad.",
            "Toss to combine.",
            "Serve chilled."
        ]
    ),
    Recipe(
        name: "Egg White Omelette",
        ingredients: [
            "4 egg whites",
            "1/4 cup spinach, chopped",
            "1/4 cup mushrooms, sliced",
            "1 tbsp olive oil",
            "Salt and pepper to taste"
        ],
        directions: [
            "Heat olive oil in a non-stick skillet over medium heat.",
            "Add mushrooms and spinach, sauté until tender.",
            "Pour egg whites over the vegetables.",
            "Cook until set, then fold over.",
            "Season with salt and pepper.",
            "Serve hot."
        ]
    ),
    Recipe(
        name: "Greek Yogurt Parfait",
        ingredients: [
            "1 cup Greek yogurt",
            "1/2 cup mixed berries",
            "1/4 cup granola",
            "1 tbsp honey"
        ],
        directions: [
            "In a glass, layer Greek yogurt, berries, and granola.",
            "Drizzle honey on top.",
            "Serve immediately."
        ]
    ),
    Recipe(
        name: "Tuna Salad Lettuce Wraps",
        ingredients: [
            "1 can tuna, drained",
            "2 tbsp mayonnaise",
            "1 celery stalk, chopped",
            "1 tbsp red onion, chopped",
            "Lettuce leaves",
            "Salt and pepper to taste"
        ],
        directions: [
            "In a bowl, mix tuna, mayonnaise, celery, red onion, salt, and pepper.",
            "Spoon the mixture onto lettuce leaves.",
            "Wrap and secure with toothpicks if necessary.",
            "Serve chilled."
        ]
    ),
    Recipe(
        name: "Black Bean and Corn Salad",
        ingredients: [
            "1 can black beans, drained",
            "1 cup corn kernels",
            "1 red bell pepper, diced",
            "1/4 cup red onion, chopped",
            "2 tbsp lime juice",
            "2 tbsp olive oil",
            "Salt and pepper to taste",
            "Fresh cilantro for garnish"
        ],
        directions: [
            "In a large bowl, combine black beans, corn, bell pepper, and red onion.",
            "In a small bowl, whisk lime juice, olive oil, salt, and pepper.",
            "Pour dressing over the salad and toss.",
            "Garnish with fresh cilantro.",
            "Serve chilled or at room temperature."
        ]
    )
]

// Vegetarian Recipes
let vegetarianRecipes: [Recipe] = [
    Recipe(
        name: "Vegetarian Stir-Fry",
        ingredients: [
            "1 cup broccoli florets",
            "1 bell pepper, sliced",
            "1 carrot, sliced",
            "1 zucchini, sliced",
            "2 tbsp soy sauce",
            "1 tbsp sesame oil",
            "1 tsp minced garlic",
            "1 tsp minced ginger"
        ],
        directions: [
            "Heat sesame oil in a wok over medium-high heat.",
            "Add garlic and ginger, sauté for 1 minute.",
            "Add all vegetables and stir-fry for 5-7 minutes.",
            "Add soy sauce and stir well.",
            "Cook for another 2 minutes.",
            "Serve over steamed rice or noodles."
        ]
    ),
    Recipe(
        name: "Caprese Salad",
        ingredients: [
            "3 tomatoes, sliced",
            "8 oz fresh mozzarella, sliced",
            "Fresh basil leaves",
            "2 tbsp balsamic glaze",
            "2 tbsp olive oil",
            "Salt and pepper to taste"
        ],
        directions: [
            "Arrange tomato and mozzarella slices alternately on a platter.",
            "Tuck basil leaves between slices.",
            "Drizzle with olive oil and balsamic glaze.",
            "Season with salt and pepper.",
            "Serve immediately."
        ]
    ),
    Recipe(
        name: "Vegetable Soup",
        ingredients: [
            "1 tbsp olive oil",
            "1 onion, chopped",
            "2 carrots, sliced",
            "2 celery stalks, sliced",
            "1 zucchini, diced",
            "1 can diced tomatoes",
            "4 cups vegetable broth",
            "1 tsp dried thyme",
            "Salt and pepper to taste"
        ],
        directions: [
            "Heat olive oil in a large pot over medium heat.",
            "Add onion, carrots, and celery, sauté until softened.",
            "Add zucchini and cook for 2 minutes.",
            "Stir in diced tomatoes and vegetable broth.",
            "Add thyme, salt, and pepper.",
            "Bring to a boil, then reduce heat and simmer for 20 minutes.",
            "Serve hot."
        ]
    ),
    Recipe(
        name: "Vegetarian Chili",
        ingredients: [
            "1 tbsp olive oil",
            "1 onion, chopped",
            "1 bell pepper, chopped",
            "2 cloves garlic, minced",
            "1 can black beans",
            "1 can kidney beans",
            "1 can diced tomatoes",
            "2 tbsp chili powder",
            "1 tsp cumin",
            "Salt and pepper to taste"
        ],
        directions: [
            "Heat olive oil in a pot over medium heat.",
            "Add onion, bell pepper, and garlic, sauté until tender.",
            "Add beans, diced tomatoes, chili powder, cumin, salt, and pepper.",
            "Stir well and bring to a boil.",
            "Reduce heat and simmer for 30 minutes.",
            "Serve with shredded cheese and sour cream if desired."
        ]
    ),
    Recipe(
        name: "Spinach and Feta Stuffed Peppers",
        ingredients: [
            "4 bell peppers, halved and seeded",
            "2 cups spinach, chopped",
            "1 cup cooked rice",
            "1/2 cup feta cheese, crumbled",
            "1/4 cup pine nuts",
            "2 tbsp olive oil",
            "Salt and pepper to taste"
        ],
        directions: [
            "Preheat oven to 375°F (190°C).",
            "In a bowl, combine spinach, rice, feta cheese, pine nuts, olive oil, salt, and pepper.",
            "Stuff bell pepper halves with the mixture.",
            "Place peppers in a baking dish.",
            "Bake for 30-35 minutes until peppers are tender.",
            "Serve warm."
        ]
    ),
    Recipe(
        name: "Vegetarian Tacos",
        ingredients: [
            "8 corn tortillas",
            "1 can black beans, drained",
            "1 cup corn kernels",
            "1 avocado, sliced",
            "1 tomato, diced",
            "1/4 cup red onion, chopped",
            "Cilantro and lime wedges for garnish",
            "Salsa and sour cream"
        ],
        directions: [
            "Warm tortillas in a skillet or microwave.",
            "In a bowl, mix black beans, corn, tomato, and red onion.",
            "Spoon mixture onto tortillas.",
            "Top with avocado slices.",
            "Garnish with cilantro and lime wedges.",
            "Serve with salsa and sour cream."
        ]
    ),
    Recipe(
        name: "Pasta Primavera",
        ingredients: [
            "8 oz pasta of your choice",
            "1 tbsp olive oil",
            "1 zucchini, sliced",
            "1 yellow squash, sliced",
            "1 cup cherry tomatoes",
            "2 cloves garlic, minced",
            "1/4 cup grated Parmesan cheese",
            "Salt and pepper to taste"
        ],
        directions: [
            "Cook pasta according to package instructions.",
            "Heat olive oil in a skillet over medium heat.",
            "Add garlic and sauté for 1 minute.",
            "Add zucchini, squash, and cherry tomatoes, cook until tender.",
            "Drain pasta and add to the skillet.",
            "Toss to combine and season with salt and pepper.",
            "Sprinkle with Parmesan cheese before serving."
        ]
    ),
    Recipe(
        name: "Vegetable Fried Rice",
        ingredients: [
            "2 cups cooked rice",
            "1 cup mixed vegetables (peas, carrots, corn)",
            "2 eggs, beaten",
            "2 tbsp soy sauce",
            "1 tbsp sesame oil",
            "2 cloves garlic, minced",
            "Salt and pepper to taste",
            "Green onions for garnish"
        ],
        directions: [
            "Heat sesame oil in a wok over medium heat.",
            "Add garlic and sauté for 1 minute.",
            "Add mixed vegetables and cook until tender.",
            "Push vegetables to one side and scramble eggs on the other side.",
            "Add cooked rice and soy sauce, stir-fry everything together.",
            "Season with salt and pepper.",
            "Garnish with chopped green onions.",
            "Serve hot."
        ]
    ),
    Recipe(
        name: "Vegetarian Quiche",
        ingredients: [
            "1 pie crust",
            "4 eggs",
            "1 cup milk",
            "1 cup spinach, chopped",
            "1/2 cup mushrooms, sliced",
            "1/2 cup shredded cheddar cheese",
            "Salt and pepper to taste"
        ],
        directions: [
            "Preheat oven to 350°F (175°C).",
            "Place pie crust in a pie dish.",
            "In a bowl, whisk eggs and milk.",
            "Add spinach, mushrooms, cheese, salt, and pepper.",
            "Pour the mixture into the pie crust.",
            "Bake for 45-50 minutes until set.",
            "Let cool slightly before slicing.",
            "Serve warm."
        ]
    ),
    Recipe(
        name: "Tomato Basil Soup",
        ingredients: [
            "1 tbsp olive oil",
            "1 onion, chopped",
            "2 cloves garlic, minced",
            "28 oz can crushed tomatoes",
            "2 cups vegetable broth",
            "1/2 cup heavy cream",
            "1/4 cup fresh basil leaves",
            "Salt and pepper to taste"
        ],
        directions: [
            "Heat olive oil in a pot over medium heat.",
            "Add onion and garlic, sauté until softened.",
            "Add crushed tomatoes and vegetable broth.",
            "Bring to a simmer and cook for 15 minutes.",
            "Stir in heavy cream and basil leaves.",
            "Use an immersion blender to puree until smooth.",
            "Season with salt and pepper.",
            "Serve hot with crusty bread."
        ]
    )
]
