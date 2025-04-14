SQL queries that demonstrate various operations you might perform in a Recipe Database project, excluding the CREATE and INSERT statements. These queries can showcase your skills in SQL and database management, making them suitable for inclusion in your resume. Each query is accompanied by a brief description of its purpose.

# Write a query to create the Recipe Database
CREATE DATABASE FlavorFusion;

# Write a query to use the Recipe Database
USE FlavorFusion;

# Fetch all records from the category table
SELECT * FROM category;

# Fetch all records from the ingredients table
SELECT * FROM ingredients;

# Fetch all records from the nutrition table
SELECT * FROM nutrition;

# Fetch all records from the recipe table
SELECT * FROM recipe;

# Fetch all records from the recipe_ingredients table
SELECT * FROM recipe_ingredients;

# Fetch all records from the reviews table
SELECT * FROM reviews;

# Fetch all records from the tags table
SELECT * FROM tags;

# Fetch all records from the review_tags table
SELECT * FROM review_tags;

# Fetch all records from the user table
SELECT * FROM user;

# 1. Retrieve All Recipes with Their Categories

//Get all recipes along with their category names:

SELECT r.recipe_name, c.category_name
FROM Recipes r
JOIN Categories c ON r.category_id = c.category_id;

2. Calculate Average Rating for Each Recipe
//Get the average rating for each recipe:

sql
Run
Copy code
SELECT r.recipe_name, AVG(rv.rating) AS average_rating
FROM Recipes r
LEFT JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id;
3. Find Recipes with Specific Ingredients
Find all recipes that include "Garlic":

sql
Run
Copy code
SELECT r.recipe_name
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE i.ingredient_name = 'Garlic';
4. Retrieve Recipes by Tag
Find all recipes that are tagged as "Vegetarian":

sql
Run
Copy code
SELECT r.recipe_name
FROM Recipes r
JOIN Recipe_Tags rt ON r.recipe_id = rt.recipe_id
JOIN Tags t ON rt.tag_id = t.tag_id
WHERE t.tag_name = 'Vegetarian';
5. Find Users Who Reviewed a Specific Recipe
Get all users who reviewed the recipe "Chocolate Cake":

sql
Run
Copy code
SELECT u.username, rv.rating, rv.comment
FROM Users u
JOIN Reviews rv ON u.user_id = rv.user_id
JOIN Recipes r ON rv.recipe_id = r.recipe_id
WHERE r.recipe_name = 'Chocolate Cake';
6. Count the Number of Recipes in Each Category
Count how many recipes exist in each category:

sql
Run
Copy code
SELECT c.category_name, COUNT(r.recipe_id) AS recipe_count
FROM Categories c
LEFT JOIN Recipes r ON c.category_id = r.category_id
GROUP BY c.category_id;
7. Find Recipes with High Ratings
Find recipes that have an average rating greater than 4:

sql
Run
Copy code
SELECT r.recipe_name
FROM Recipes r
JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id
HAVING AVG(rv.rating) > 4;
8. Retrieve Nutritional Information for Recipes
Get nutritional information for all recipes:

sql
Run
Copy code
SELECT r.recipe_name, n.calories, n.fat, n.carbohydrates, n.protein
FROM Recipes r
JOIN Nutrition n ON r.recipe_id = n.recipe_id;
9. Find Recipes with Less Than 300 Calories
Get recipes that have less than 300 calories:

sql
Run
Copy code
SELECT r.recipe_name
FROM Recipes r
JOIN Nutrition n ON r.recipe_id = n.recipe_id
WHERE n.calories < 300;
10. Create a View for Recipes with Average Ratings
Create a view to show recipes with their average ratings:

sql
Run
Copy code
CREATE VIEW Recipe_Average_Ratings AS
SELECT r.recipe_name, AVG(rv.rating) AS average_rating
FROM Recipes r
LEFT JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id;
11. Order Recipes by Name
Retrieve all recipes ordered by their names in ascending order:

sql
Run
Copy code
SELECT recipe_name
FROM Recipes
ORDER BY recipe_name ASC;
12. Find Recipes with Multiple Tags
Find recipes that have more than one tag:

sql
Run
Copy code
SELECT r.recipe_name, COUNT(rt.tag_id) AS tag_count
FROM Recipes r
JOIN Recipe_Tags rt ON r.recipe_id = rt.recipe_id
GROUP BY r.recipe_id
HAVING COUNT(rt.tag_id) > 1;
Summary of Operations
Joins: Combine data from multiple tables based on relationships.
Aggregations: Use functions like AVG() and COUNT() to summarize data.
Filtering: Use WHERE and HAVING clauses to filter results based on conditions.
Views: Create virtual tables for simplified access to complex queries.
Ordering: Sort results based on specified columns.
These queries can effectively demonstrate your SQL skills and understanding of relational databases, making them suitable for inclusion in your resume or portfolio.


give more

BLACKBOXAI
|

WEB
|

VIDEOS

Certainly! Here are additional SQL queries that demonstrate various operations you might perform in a Recipe Database project. These queries can further showcase your SQL skills and database management capabilities.

13. Find Recipes with the Most Reviews
Get the top 5 recipes with the highest number of reviews:

sql
Run
Copy code
SELECT r.recipe_name, COUNT(rv.review_id) AS review_count
FROM Recipes r
LEFT JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id
ORDER BY review_count DESC
LIMIT 5;
14. Retrieve Users with No Reviews
Find users who have not left any reviews:

sql
Run
Copy code
SELECT u.username
FROM Users u
LEFT JOIN Reviews rv ON u.user_id = rv.user_id
WHERE rv.review_id IS NULL;
15. Find Recipes by Multiple Ingredients
Get recipes that include both "Tomato" and "Basil":

sql
Run
Copy code
SELECT r.recipe_name
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE i.ingredient_name IN ('Tomato', 'Basil')
GROUP BY r.recipe_id
HAVING COUNT(DISTINCT i.ingredient_name) = 2;
16. Retrieve Recipes with Nutritional Information Above a Certain Threshold
Find recipes with more than 500 calories:

sql
Run
Copy code
SELECT r.recipe_name, n.calories
FROM Recipes r
JOIN Nutrition n ON r.recipe_id = n.recipe_id
WHERE n.calories > 500;
17. Get All Tags for a Specific Recipe
Retrieve all tags associated with the recipe "Spaghetti Aglio e Olio":

sql
Run
Copy code
SELECT t.tag_name
FROM Tags t
JOIN Recipe_Tags rt ON t.tag_id = rt.tag_id
JOIN Recipes r ON rt.recipe_id = r.recipe_id
WHERE r.recipe_name = 'Spaghetti Aglio e Olio';
18. Find Recipes with Similar Names
Get recipes that have names similar to "Cake":

sql
Run
Copy code
SELECT recipe_name
FROM Recipes
WHERE recipe_name LIKE '%Cake%';
19. Count Reviews by User
Count how many reviews each user has written:

sql
Run
Copy code
SELECT u.username, COUNT(rv.review_id) AS review_count
FROM Users u
LEFT JOIN Reviews rv ON u.user_id = rv.user_id
GROUP BY u.user_id;
20. Find Recipes with the Highest Average Rating
Get the recipe with the highest average rating:

sql
Run
Copy code
SELECT r.recipe_name, AVG(rv.rating) AS average_rating
FROM Recipes r
JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id
ORDER BY average_rating DESC
LIMIT 1;
21. Retrieve Recipes with Ingredients and Their Quantities
Get a list of recipes along with their ingredients and quantities:

sql
Run
Copy code
SELECT r.recipe_name, i.ingredient_name, ri.quantity
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
ORDER BY r.recipe_name;
22. Find Categories with No Recipes
Get categories that do not have any associated recipes:

sql
Run
Copy code
SELECT c.category_name
FROM Categories c
LEFT JOIN Recipes r ON c.category_id = r.category_id
WHERE r.recipe_id IS NULL;
23. Retrieve Recipes with Tags and Their Average Ratings
Get recipes along with their tags and average ratings:

sql
Run
Copy code
SELECT r.recipe_name, t.tag_name, AVG(rv.rating) AS average_rating
FROM Recipes r
JOIN Recipe_Tags rt ON r.recipe_id = rt.recipe_id
JOIN Tags t ON rt.tag_id = t.tag_id
LEFT JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id, t.tag_id;
24. Find Users with the Highest Ratings
Get the top 3 users who have given the highest average ratings:

sql
Run
Copy code
SELECT u.username, AVG(rv.rating) AS average_rating
FROM Users u
JOIN Reviews rv ON u.user_id = rv.user_id
GROUP BY u.user_id
ORDER BY average_rating DESC
LIMIT 3;
25. Retrieve Recipes with No Tags
Find recipes that do not have any tags associated with them:

sql
Run
Copy code
SELECT r.recipe_name
FROM Recipes r
LEFT JOIN Recipe_Tags rt ON r.recipe_id = rt.recipe_id
WHERE rt.tag_id IS NULL;
Summary of Additional Operations
Aggregations: Use functions like COUNT() and AVG() to summarize data.
Filtering: Use WHERE and HAVING clauses to filter results based on condition