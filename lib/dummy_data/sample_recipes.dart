import 'package:mykitchenapp/modals/recipe_model.dart';

List<RecipeModel> dummyRecipes = [
  const RecipeModel(
    id: "1",
    name: "Butter Chicken",
    imagePath: "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400",
    rating: 4.8,
    category: ["Dinner", "North", "Punjabi"],
    details: "A rich and creamy tomato-based curry with tender chicken pieces, perfect for dinner. This classic North Indian dish is beloved worldwide for its aromatic spices and velvety texture.",
    ingredients: [
      "500g chicken breast, cubed",
      "1 cup heavy cream",
      "400g canned tomatoes",
      "2 tbsp butter",
      "1 tbsp garam masala",
      "1 tsp turmeric",
      "2 tbsp ginger-garlic paste",
      "1 onion, finely chopped",
      "Salt to taste",
      "Fresh coriander for garnish"
    ],
    steps: [
      "Marinate chicken with yogurt, turmeric, and salt for 30 minutes",
      "Heat butter in a pan and sauté onions until golden",
      "Add ginger-garlic paste and cook for 2 minutes",
      "Add tomatoes and cook until they break down",
      "Add marinated chicken and cook for 10 minutes",
      "Pour in cream and garam masala, simmer for 5 minutes",
      "Garnish with fresh coriander and serve hot"
    ],
    time: "45 min",
    nutrients: {
      "calories": "380",
      "protein": "28g",
      "carbs": "12g",
      "fat": "26g"
    },
    reviews: [
      "Absolutely delicious! The best butter chicken I've made at home.",
      "Perfect balance of spices and creaminess.",
      "My family loved this recipe, will definitely make again."
    ],
    author: "Chef Rajesh Sharma",
    shortDescription: "Creamy and aromatic North Indian chicken curry"
  ),

  const RecipeModel(
    id: "2",
    name: "Dhokla",
    imagePath: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400",
    rating: 4.6,
    category: ["Breakfast", "Gujarati"],
    details: "Soft and spongy steamed cake made from fermented rice and chickpea flour. This traditional Gujarati snack is light, healthy, and perfect for breakfast or evening tea.",
    ingredients: [
      "1 cup besan (chickpea flour)",
      "1/2 cup rice flour",
      "1 cup water",
      "1 tsp ginger paste",
      "1 tsp green chili paste",
      "1 tsp eno fruit salt",
      "1 tbsp oil",
      "1 tsp mustard seeds",
      "Curry leaves",
      "Green chilies for tempering"
    ],
    steps: [
      "Mix besan, rice flour, and water to make smooth batter",
      "Add ginger paste, green chili paste, and salt",
      "Just before steaming, add eno and mix gently",
      "Pour into greased steamer plates and steam for 15 minutes",
      "Cool completely and cut into squares",
      "Prepare tempering with mustard seeds and curry leaves",
      "Pour tempering over dhokla and serve with chutney"
    ],
    time: "30 min",
    nutrients: {
      "calories": "180",
      "protein": "8g",
      "carbs": "28g",
      "fat": "4g"
    },
    reviews: [
      "So fluffy and delicious! Just like my grandmother made.",
      "Perfect texture and taste. Great for breakfast.",
      "Healthy and tasty snack option for kids."
    ],
    author: "Chef Meera Patel",
    shortDescription: "Fluffy steamed Gujarati snack made from chickpea flour"
  ),

  const RecipeModel(
    id: "3",
    name: "Hyderabadi Biryani",
    imagePath: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400",
    rating: 4.9,
    category: ["Dinner", "Hyderabadi"],
    details: "Aromatic basmati rice layered with spiced mutton, cooked in the traditional dum style. This royal dish from Hyderabad is known for its rich flavors and perfect balance of spices.",
    ingredients: [
      "500g mutton, cut into pieces",
      "2 cups basmati rice",
      "1 cup yogurt",
      "2 tbsp ginger-garlic paste",
      "1 tsp red chili powder",
      "1/2 tsp turmeric",
      "1 tsp garam masala",
      "Saffron soaked in warm milk",
      "Fried onions",
      "Mint and coriander leaves",
      "Ghee for cooking"
    ],
    steps: [
      "Marinate mutton with yogurt, ginger-garlic paste, and spices for 2 hours",
      "Cook rice until 70% done with whole spices",
      "In heavy-bottomed pot, layer marinated mutton",
      "Cover with partially cooked rice",
      "Sprinkle fried onions, mint, coriander, and saffron milk",
      "Cover with aluminum foil, then place lid",
      "Cook on high heat for 3 minutes, then dum cook on low heat for 45 minutes",
      "Let it rest for 10 minutes before opening"
    ],
    time: "150 min",
    nutrients: {
      "calories": "520",
      "protein": "32g",
      "carbs": "48g",
      "fat": "22g"
    },
    reviews: [
      "Authentic Hyderabadi taste! Worth the effort.",
      "Best biryani recipe I've tried. The dum cooking makes all the difference.",
      "Restaurant quality biryani at home. Highly recommended!"
    ],
    author: "Chef Usman Ali",
    shortDescription: "Royal Hyderabadi-style mutton biryani cooked in dum method"
  ),

  const RecipeModel(
    id: "4",
    name: "Masala Dosa",
    imagePath: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400",
    rating: 4.7,
    category: ["Breakfast", "South Indian"],
    details: "Crispy fermented crepe made from rice and lentil batter, filled with spiced potato curry. This South Indian breakfast staple is served with coconut chutney and sambar.",
    ingredients: [
      "2 cups rice",
      "1/2 cup urad dal",
      "1/4 cup fenugreek seeds",
      "4 medium potatoes, boiled",
      "1 large onion, sliced",
      "1 tsp mustard seeds",
      "1 tsp turmeric",
      "Curry leaves",
      "Green chilies",
      "Oil for cooking"
    ],
    steps: [
      "Soak rice, urad dal, and fenugreek seeds separately for 4 hours",
      "Grind into smooth batter and ferment overnight",
      "For filling, heat oil and add mustard seeds",
      "Add onions, curry leaves, and green chilies",
      "Add boiled potatoes with turmeric and salt",
      "Heat pan, pour batter, and spread thin",
      "Cook until crispy, add filling, and fold",
      "Serve hot with chutney and sambar"
    ],
    time: "30 min",
    nutrients: {
      "calories": "320",
      "protein": "12g",
      "carbs": "58g",
      "fat": "6g"
    },
    reviews: [
      "Perfect crispy dosa! The fermentation process is key.",
      "Authentic South Indian taste. Great breakfast option.",
      "Love the combination of crispy dosa and spiced potato filling."
    ],
    author: "Chef Lakshmi Iyer",
    shortDescription: "Crispy South Indian crepe with spiced potato filling"
  ),

  const RecipeModel(
    id: "5",
    name: "Chocolate Lava Cake",
    imagePath: "https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=400",
    rating: 4.8,
    category: ["Desserts"],
    details: "Decadent individual chocolate cakes with a molten chocolate center. This restaurant-style dessert is perfect for special occasions and chocolate lovers.",
    ingredients: [
      "100g dark chocolate",
      "100g butter",
      "2 large eggs",
      "2 tbsp sugar",
      "2 tbsp all-purpose flour",
      "Pinch of salt",
      "Butter for greasing",
      "Cocoa powder for dusting",
      "Vanilla ice cream for serving"
    ],
    steps: [
      "Preheat oven to 200°C",
      "Melt chocolate and butter in double boiler",
      "Whisk eggs and sugar until pale",
      "Combine chocolate mixture with egg mixture",
      "Fold in flour and salt",
      "Grease ramekins and dust with cocoa powder",
      "Pour batter into ramekins",
      "Bake for 12-14 minutes until edges are firm",
      "Let cool for 1 minute, then invert onto plates",
      "Serve immediately with vanilla ice cream"
    ],
    time: "25 min",
    nutrients: {
      "calories": "420",
      "protein": "8g",
      "carbs": "35g",
      "fat": "28g"
    },
    reviews: [
      "Perfect molten center every time! Impressive dessert.",
      "Restaurant quality at home. My guests were amazed.",
      "Rich and indulgent. Perfect for chocolate cravings."
    ],
    author: "Chef Sophie Laurent",
    shortDescription: "Individual chocolate cakes with molten centers"
  ),

  const RecipeModel(
    id: "6",
    name: "Vegan Buddha Bowl",
    imagePath: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?",
    rating: 4.5,
    category: ["Lunch", "Vegan"],
    details: "Nutritious and colorful bowl packed with quinoa, roasted vegetables, and tahini dressing. This plant-based meal is perfect for healthy lunch options.",
    ingredients: [
      "1 cup quinoa",
      "2 cups mixed vegetables (broccoli, bell peppers, carrots)",
      "1 can chickpeas, drained",
      "2 tbsp olive oil",
      "1 avocado, sliced",
      "2 tbsp tahini",
      "1 lemon, juiced",
      "2 tbsp maple syrup",
      "Salt and pepper to taste",
      "Pumpkin seeds for garnish"
    ],
    steps: [
      "Cook quinoa according to package instructions",
      "Preheat oven to 200°C",
      "Toss vegetables and chickpeas with olive oil, salt, and pepper",
      "Roast for 25-30 minutes until tender",
      "Whisk together tahini, lemon juice, maple syrup, and water for dressing",
      "Assemble bowls with quinoa as base",
      "Top with roasted vegetables, chickpeas, and avocado",
      "Drizzle with tahini dressing and garnish with pumpkin seeds"
    ],
    time: "40 min",
    nutrients: {
      "calories": "450",
      "protein": "18g",
      "carbs": "52g",
      "fat": "20g"
    },
    reviews: [
      "So filling and nutritious! Perfect for meal prep.",
      "Love the variety of textures and flavors.",
      "Great way to get lots of vegetables in one meal."
    ],
    author: "Chef Emma Green",
    shortDescription: "Colorful vegan bowl with quinoa and roasted vegetables"
  ),

  const RecipeModel(
    id: "7",
    name: "Mango Lassi",
    imagePath: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400",
    rating: 4.6,
    category: ["Drinks", "Punjabi"],
    details: "Refreshing yogurt-based drink blended with sweet mangoes. This traditional Indian beverage is perfect for hot summer days and pairs well with spicy food.",
    ingredients: [
      "2 ripe mangoes, peeled and chopped",
      "1 cup plain yogurt",
      "1/2 cup milk",
      "3 tbsp sugar",
      "1/4 tsp cardamom powder",
      "Ice cubes",
      "Mint leaves for garnish"
    ],
    steps: [
      "Blend mangoes until smooth",
      "Add yogurt, milk, and sugar",
      "Blend until creamy and frothy",
      "Add cardamom powder and blend briefly",
      "Taste and adjust sweetness if needed",
      "Pour over ice in glasses",
      "Garnish with mint leaves and serve chilled"
    ],
    time: "10 min",
    nutrients: {
      "calories": "180",
      "protein": "6g",
      "carbs": "32g",
      "fat": "4g"
    },
    reviews: [
      "Perfect summer drink! So refreshing and creamy.",
      "Love the authentic taste. Great with spicy food.",
      "Easy to make and always a crowd pleaser."
    ],
    author: "Chef Priya Kapoor",
    shortDescription: "Creamy yogurt drink blended with fresh mangoes"
  ),

  const RecipeModel(
    id: "8",
    name: "Dal Baati Churma",
    imagePath: "https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400",
    rating: 4.7,
    category: ["Dinner", "Rajasthani"],
    details: "Traditional Rajasthani dish consisting of baked wheat balls served with spiced lentils and sweet churma. This hearty meal represents the essence of Rajasthani cuisine.",
    ingredients: [
      "2 cups whole wheat flour",
      "1/4 cup ghee",
      "1 cup mixed lentils",
      "2 tbsp ginger-garlic paste",
      "1 tsp turmeric",
      "1 tsp red chili powder",
      "1 tsp garam masala",
      "2 tbsp jaggery",
      "1/4 cup almonds, chopped",
      "Ghee for serving"
    ],
    steps: [
      "Mix flour with ghee and water to form stiff dough",
      "Shape into small balls and bake at 180°C for 30 minutes",
      "Cook lentils with turmeric until soft",
      "Prepare tempering with spices and add to lentils",
      "For churma, crush some baatis and mix with jaggery and ghee",
      "Serve hot baatis with dal and churma",
      "Pour ghee over baatis before serving"
    ],
    time: "90 min",
    nutrients: {
      "calories": "480",
      "protein": "16g",
      "carbs": "58g",
      "fat": "20g"
    },
    reviews: [
      "Authentic Rajasthani flavors! Takes me back to my childhood.",
      "The combination of all three elements is perfect.",
      "Rich and satisfying meal. Great for special occasions."
    ],
    author: "Chef Vikram Singh",
    shortDescription: "Traditional Rajasthani meal with baked wheat balls and lentils"
  ),

  const RecipeModel(
    id: "9",
    name: "Fish Curry",
    imagePath: "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400",
    rating: 4.8,
    category: ["Dinner", "Seafood", "South Indian"],
    details: "Tangy and spicy fish curry cooked in coconut milk with traditional South Indian spices. This coastal delicacy is best enjoyed with steamed rice.",
    ingredients: [
      "500g fish fillets",
      "1 cup coconut milk",
      "2 tbsp tamarind paste",
      "1 tbsp coriander seeds",
      "1 tsp fenugreek seeds",
      "4 red chilies",
      "1 tsp turmeric",
      "Curry leaves",
      "2 tbsp coconut oil",
      "Salt to taste"
    ],
    steps: [
      "Marinate fish with turmeric and salt",
      "Dry roast coriander, fenugreek, and red chilies",
      "Grind roasted spices with coconut to make paste",
      "Heat coconut oil and fry fish pieces lightly",
      "In same pan, add spice paste and cook",
      "Add tamarind paste and coconut milk",
      "Simmer until fish is cooked through",
      "Garnish with curry leaves and serve hot"
    ],
    time: "35 min",
    nutrients: {
      "calories": "320",
      "protein": "28g",
      "carbs": "8g",
      "fat": "20g"
    },
    reviews: [
      "Perfect balance of spices and coconut. Authentic coastal taste.",
      "The fish was so tender and flavorful.",
      "Great recipe for seafood lovers. Pairs perfectly with rice."
    ],
    author: "Chef Ravi Nair",
    shortDescription: "Spicy South Indian fish curry in coconut milk"
  ),

  const RecipeModel(
    id: "10",
    name: "Puran Poli",
    imagePath: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400",
    rating: 4.6,
    category: ["Desserts", "Marathi"],
    details: "Sweet flatbread stuffed with spiced lentil and jaggery filling. This traditional Maharashtrian dessert is especially popular during festivals.",
    ingredients: [
      "1 cup chana dal",
      "1 cup jaggery",
      "1/2 tsp cardamom powder",
      "1/4 tsp nutmeg powder",
      "2 cups all-purpose flour",
      "1/4 cup oil",
      "Ghee for cooking",
      "Salt to taste"
    ],
    steps: [
      "Cook chana dal until very soft and mash well",
      "Add jaggery and cook until mixture thickens",
      "Add cardamom and nutmeg powder",
      "Make soft dough with flour, oil, and water",
      "Roll small portions and stuff with dal mixture",
      "Seal edges and roll gently into flatbread",
      "Cook on griddle with ghee until golden spots appear",
      "Serve warm with more ghee"
    ],
    time: "75 min",
    nutrients: {
      "calories": "380",
      "protein": "12g",
      "carbs": "65g",
      "fat": "8g"
    },
    reviews: [
      "Authentic Maharashtrian taste! Just like my mother made.",
      "Perfect sweetness and texture. Great for festivals.",
      "The filling is so flavorful and aromatic."
    ],
    author: "Chef Sunita Deshmukh",
    shortDescription: "Traditional Marathi sweet flatbread with lentil filling"
  ),

  const RecipeModel(
    id: "11",
    name: "Grilled Salmon",
    imagePath: "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400",
    rating: 4.7,
    category: ["Dinner", "Seafood"],
    details: "Perfectly grilled salmon with herbs and lemon. This healthy and delicious dish is rich in omega-3 fatty acids and perfect for a light dinner.",
    ingredients: [
      "4 salmon fillets",
      "2 tbsp olive oil",
      "2 cloves garlic, minced",
      "1 lemon, juiced and zested",
      "1 tbsp fresh dill",
      "1 tbsp fresh parsley",
      "Salt and black pepper",
      "Lemon wedges for serving"
    ],
    steps: [
      "Preheat grill to medium-high heat",
      "Mix olive oil, garlic, lemon juice, and herbs",
      "Season salmon with salt and pepper",
      "Brush salmon with herb mixture",
      "Grill for 4-5 minutes per side",
      "Check for doneness - fish should flake easily",
      "Serve immediately with lemon wedges"
    ],
    time: "15 min",
    nutrients: {
      "calories": "280",
      "protein": "35g",
      "carbs": "2g",
      "fat": "14g"
    },
    reviews: [
      "Perfectly cooked salmon every time! The herbs make it special.",
      "Simple yet elegant. Great for dinner parties.",
      "Healthy and delicious. My go-to salmon recipe."
    ],
    author: "Chef Michael Thompson",
    shortDescription: "Herb-marinated grilled salmon with lemon"
  ),

  const RecipeModel(
    id: "12",
    name: "Sindhi Curry",
    imagePath: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?",
    rating: 4.5,
    category: ["Lunch", "Sindhi"],
    details: "Tangy and flavorful mixed vegetable curry with tamarind and spices. This traditional Sindhi dish is packed with vegetables and pairs well with rice.",
    ingredients: [
      "1 cup mixed vegetables (okra, eggplant, potatoes)",
      "2 tbsp tamarind paste",
      "1 tsp turmeric",
      "1 tsp red chili powder",
      "1 tsp coriander powder",
      "1/2 tsp asafoetida",
      "2 tbsp oil",
      "Curry leaves",
      "Green chilies",
      "Fresh coriander"
    ],
    steps: [
      "Heat oil and add curry leaves and green chilies",
      "Add mixed vegetables and sauté",
      "Add all spices and cook for 2 minutes",
      "Add tamarind paste and water",
      "Simmer until vegetables are tender",
      "Adjust seasoning and consistency",
      "Garnish with fresh coriander"
    ],
    time: "30 min",
    nutrients: {
      "calories": "180",
      "protein": "6g",
      "carbs": "28g",
      "fat": "8g"
    },
    reviews: [
      "Perfect balance of tangy and spicy flavors.",
      "Love the variety of vegetables in this curry.",
      "Authentic Sindhi taste. Great with rice."
    ],
    author: "Chef Kamala Advani",
    shortDescription: "Tangy Sindhi mixed vegetable curry with tamarind"
  ),

  const RecipeModel(
    id: "13",
    name: "Avocado Toast",
    imagePath: "https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?w=400",
    rating: 4.4,
    category: ["Breakfast", "Vegan"],
    details: "Simple and nutritious breakfast with mashed avocado on toasted bread. This trendy breakfast option is packed with healthy fats and fiber.",
    ingredients: [
      "2 slices whole grain bread",
      "1 ripe avocado",
      "1 tbsp lemon juice",
      "1/4 tsp salt",
      "1/4 tsp black pepper",
      "1/4 tsp red pepper flakes",
      "Cherry tomatoes for topping",
      "Pumpkin seeds for garnish"
    ],
    steps: [
      "Toast bread slices until golden brown",
      "Mash avocado with lemon juice, salt, and pepper",
      "Spread avocado mixture generously on toast",
      "Top with halved cherry tomatoes",
      "Sprinkle with red pepper flakes and pumpkin seeds",
      "Serve immediately while toast is still warm"
    ],
    time: "5 min",
    nutrients: {
      "calories": "280",
      "protein": "8g",
      "carbs": "24g",
      "fat": "18g"
    },
    reviews: [
      "Perfect breakfast! Simple and delicious.",
      "Great way to start the day with healthy fats.",
      "Love the combination of flavors and textures."
    ],
    author: "Chef Lisa Parker",
    shortDescription: "Healthy breakfast with mashed avocado on toast"
  ),

  const RecipeModel(
    id: "14",
    name: "Chicken Tikka Masala",
    imagePath: "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=400",
    rating: 4.8,
    category: ["Dinner", "North", "Punjabi"],
    details: "Tender chicken pieces in rich, creamy tomato-based sauce. This popular Indian dish is perfect for dinner and loved by people of all ages.",
    ingredients: [
      "600g chicken breast, cubed",
      "1 cup heavy cream",
      "400g canned tomatoes",
      "2 tbsp yogurt",
      "2 tbsp ginger-garlic paste",
      "1 tsp garam masala",
      "1 tsp cumin powder",
      "1 tsp paprika",
      "1/2 tsp turmeric",
      "2 tbsp tomato paste",
      "Fresh coriander for garnish"
    ],
    steps: [
      "Marinate chicken with yogurt, half the ginger-garlic paste, and spices",
      "Grill or pan-fry chicken until cooked through",
      "In same pan, sauté remaining ginger-garlic paste",
      "Add tomato paste and cook for 2 minutes",
      "Add canned tomatoes and simmer until thick",
      "Stir in cream and cooked chicken",
      "Simmer for 5 minutes and adjust seasoning",
      "Garnish with coriander and serve with rice or naan"
    ],
    time: "40 min",
    nutrients: {
      "calories": "420",
      "protein": "32g",
      "carbs": "14g",
      "fat": "28g"
    },
    reviews: [
      "Restaurant quality at home! My family's favorite.",
      "Perfect balance of spices and creaminess.",
      "The marination makes all the difference."
    ],
    author: "Chef Arjun Khanna",
    shortDescription: "Creamy chicken curry with rich tomato-based sauce"
  ),

  const RecipeModel(
    id: "15",
    name: "Gulab Jamun",
    imagePath: "https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=400",
    rating: 4.9,
    category: ["Desserts", "North"],
    details: "Soft and spongy milk dumplings soaked in rose-flavored sugar syrup. This classic Indian dessert is perfect for celebrations and special occasions.",
    ingredients: [
      "1 cup milk powder",
      "1/4 cup all-purpose flour",
      "1/4 cup milk",
      "1/4 tsp baking soda",
      "2 cups sugar",
      "2 cups water",
      "1 tsp rose water",
      "4-5 cardamom pods",
      "Oil for deep frying"
    ],
    steps: [
      "Mix milk powder, flour, and baking soda",
      "Add milk gradually to form soft dough",
      "Shape into small balls without cracks",
      "Make sugar syrup with water, sugar, and cardamom",
      "Add rose water to syrup and keep warm",
      "Heat oil to medium temperature",
      "Fry balls until golden brown",
      "Immediately add to warm syrup",
      "Let them soak for at least 30 minutes before serving"
    ],
    time: "45 min",
    nutrients: {
      "calories": "320",
      "protein": "8g",
      "carbs": "58g",
      "fat": "8g"
    },
    reviews: [
      "Perfect texture and sweetness! Just like the sweet shop.",
      "The rose water adds such a lovely fragrance.",
      "Best gulab jamun recipe I've tried. Always turns out perfect."
    ],
    author: "Chef Ravi Agarwal",
    shortDescription: "Soft milk dumplings in rose-flavored sugar syrup"
  )
];
