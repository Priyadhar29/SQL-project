     SQL queries that demonstrate various operations you might perform in a Recipe Database project, excluding the CREATE and INSERT statements. 

     These queries can showcase your skills in SQL and database management, making them suitable for inclusion in your resume. 

     Each query is accompanied by a brief description of its purpose.

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

# 1. Write a query to retrieve all recipes along with their category names.

Get all recipes along with their category names:

SELECT r.recipe_name, c.category_name
FROM Recipes r
JOIN Categories c ON r.category_id = c.category_id;

# 2. Write a query to calculate the average rating for each recipe.

Get the average rating for each recipe:

SELECT r.recipe_name, AVG(rv.rating) AS average_rating
FROM Recipes r
LEFT JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id;

# 3. Write a query to find all recipes that include a specific ingredient, such as "Garlic."

Find all recipes that include "Garlic":

SELECT r.recipe_name
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE i.ingredient_name = 'Garlic';

# 4. Write a query to retrieve recipes tagged as "Vegetarian."

Find all recipes that are tagged as "Vegetarian":

SELECT r.recipe_name
FROM Recipes r
JOIN Recipe_Tags rt ON r.recipe_id = rt.recipe_id
JOIN Tags t ON rt.tag_id = t.tag_id
WHERE t.tag_name = 'Vegetarian';

# 5. Write a query to find users who reviewed a specific recipe, such as "Chocolate Cake."

Get all users who reviewed the recipe "Chocolate Cake":

SELECT u.username, rv.rating, rv.comment
FROM Users u
JOIN Reviews rv ON u.user_id = rv.user_id
JOIN Recipes r ON rv.recipe_id = r.recipe_id
WHERE r.recipe_name = 'Chocolate Cake';

# 6. Write a query to count the number of recipes in each category.

Count how many recipes exist in each category:

SELECT c.category_name, COUNT(r.recipe_id) AS recipe_count
FROM Categories c
LEFT JOIN Recipes r ON c.category_id = r.category_id
GROUP BY c.category_id;

# 7. Write a query to find recipes that have an average rating greater than 4.

Find recipes that have an average rating greater than 4:

SELECT r.recipe_name
FROM Recipes r
JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id
HAVING AVG(rv.rating) > 4;

# 8. Write a query to retrieve nutritional information for all recipes.

Get nutritional information for all recipes:

SELECT r.recipe_name, n.calories, n.fat, n.carbohydrates, n.protein
FROM Recipes r
JOIN Nutrition n ON r.recipe_id = n.recipe_id;

# 9. Write a query to find recipes that have less than 300 calories.

Get recipes that have less than 300 calories:

SELECT r.recipe_name
FROM Recipes r
JOIN Nutrition n ON r.recipe_id = n.recipe_id
WHERE n.calories < 300;

# 10. Write a query to create a view for recipes with their average ratings.

Create a view to show recipes with their average ratings:

CREATE VIEW Recipe_Average_Ratings AS
SELECT r.recipe_name, AVG(rv.rating) AS average_rating
FROM Recipes r
LEFT JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id;

# 11. Write a query to retrieve all recipes ordered by their names in ascending order.

Retrieve all recipes ordered by their names in ascending order:

SELECT recipe_name
FROM Recipes
ORDER BY recipe_name ASC;

# 12. Write a query to find recipes that have more than one tag.

Find recipes that have more than one tag:

SELECT r.recipe_name, COUNT(rt.tag_id) AS tag_count
FROM Recipes r
JOIN Recipe_Tags rt ON r.recipe_id = rt.recipe_id
GROUP BY r.recipe_id
HAVING COUNT(rt.tag_id) > 1;

# 13. Write a query to get the top 5 recipes with the highest number of reviews.

Get the top 5 recipes with the highest number of reviews:

SELECT r.recipe_name, COUNT(rv.review_id) AS review_count
FROM Recipes r
LEFT JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id
ORDER BY review_count DESC
LIMIT 5;

#14. Write a query to find users who have not left any reviews.

Find users who have not left any reviews:

SELECT u.username
FROM Users u
LEFT JOIN Reviews rv ON u.user_id = rv.user_id
WHERE rv.review_id IS NULL;

# 15. Write a query to get recipes that include both "Tomato" and "Basil."

Get recipes that include both "Tomato" and "Basil":

SELECT r.recipe_name
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE i.ingredient_name IN ('Tomato', 'Basil')
GROUP BY r.recipe_id
HAVING COUNT(DISTINCT i.ingredient_name) = 2;

# 16. Write a query to find recipes with more than 500 calories.

Find recipes with more than 500 calories:

SELECT r.recipe_name, n.calories
FROM Recipes r
JOIN Nutrition n ON r.recipe_id = n.recipe_id
WHERE n.calories > 500;

# 17. Write a query to retrieve all tags associated with the recipe "Spaghetti Aglio e Olio."

Retrieve all tags associated with the recipe "Spaghetti Aglio e Olio":

SELECT t.tag_name
FROM Tags t
JOIN Recipe_Tags rt ON t.tag_id = rt.tag_id
JOIN Recipes r ON rt.recipe_id = r.recipe_id
WHERE r.recipe_name = 'Spaghetti Aglio e Olio';

# 18. Write a query to get recipes that have names similar to "Cake."

Get recipes that have names similar to "Cake":

SELECT recipe_name
FROM Recipes
WHERE recipe_name LIKE '%Cake%';

# 19. Write a query to count how many reviews each user has written.

Count how many reviews each user has written:

SELECT u.username, COUNT(rv.review_id) AS review_count
FROM Users u
LEFT JOIN Reviews rv ON u.user_id = rv.user_id
GROUP BY u.user_id;

# 20. Write a query to get the recipe with the highest average rating.

Get the recipe with the highest average rating:

SELECT r.recipe_name, AVG(rv.rating) AS average_rating
FROM Recipes r
JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id
ORDER BY average_rating DESC
LIMIT 1;

# 21. Write a query to retrieve recipes along with their ingredients and quantities.

Get a list of recipes along with their ingredients and quantities:

SELECT r.recipe_name, i.ingredient_name, ri.quantity
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
ORDER BY r.recipe_name;

# 22. Write a query to get categories that do not have any associated recipes.

Get categories that do not have any associated recipes:

SELECT c.category_name
FROM Categories c
LEFT JOIN Recipes r ON c.category_id = r.category_id
WHERE r.recipe_id IS NULL;

# 23. Write a query to get recipes along with their tags and average ratings.

Get recipes along with their tags and average ratings:

SELECT r.recipe_name, t.tag_name, AVG(rv.rating) AS average_rating
FROM Recipes r
JOIN Recipe_Tags rt ON r.recipe_id = rt.recipe_id
JOIN Tags t ON rt.tag_id = t.tag_id
LEFT JOIN Reviews rv ON r.recipe_id = rv.recipe_id
GROUP BY r.recipe_id, t.tag_id;

# 24. Write a query to get the top 3 users who have given the highest average ratings.

Get the top 3 users who have given the highest average ratings:

SELECT u.username, AVG(rv.rating) AS average_rating
FROM Users u
JOIN Reviews rv ON u.user_id = rv.user_id
GROUP BY u.user_id
ORDER BY average_rating DESC
LIMIT 3;

# 25. Write a query to find recipes that do not have any tags associated with them.

Find recipes that do not have any tags associated with them:

SELECT r.recipe_name
FROM Recipes r
LEFT JOIN Recipe_Tags rt ON r.recipe_id = rt.recipe_id
WHERE rt.tag_id IS NULL;

Summary of Operations

        Joins: Combine data from multiple tables based on relationships.
        Aggregations: Use functions like AVG() and COUNT() to summarize data.
        Filtering: Use WHERE and HAVING clauses to filter results based on conditions.
        Views: Create virtual tables for simplified access to complex queries.
        Ordering: Sort results based on specified columns.

These queries can effectively demonstrate your SQL skills and understanding of relational databases. 