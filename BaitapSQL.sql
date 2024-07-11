---1. Tìm 5 người đã like nhà hàng nhiều nhất:
SELECT user.user_id, user.full_name, COUNT(like_res.res_id) AS like_count
FROM user
JOIN like_res ON user.user_id = like_res.user_id
GROUP BY user.user_id, user.full_name
ORDER BY like_count DESC
LIMIT 5;
---2. Tìm 2 nhà hàng có lượt like nhiều nhất:

SELECT restaurant.res_id, restaurant.res_name, COUNT(like_res.user_id) AS like_count
FROM restaurant
JOIN like_res ON restaurant.res_id = like_res.res_id
GROUP BY restaurant.res_id, restaurant.res_name
ORDER BY like_count DESC
LIMIT 2;

---3. Tìm người đã đặt hàng nhiều nhất:
SELECT user.user_id, user.full_name, COUNT(`order`.food_id) AS order_count
FROM user
JOIN `order` ON user.user_id = `order`.user_id
GROUP BY user.user_id, user.full_name
ORDER BY order_count DESC
LIMIT 1;

---4. Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng):
SELECT user.user_id, user.full_name
FROM user
LEFT JOIN `order` ON user.user_id = `order`.user_id
LEFT JOIN like_res ON user.user_id = like_res.user_id
LEFT JOIN rate_res ON user.user_id = rate_res.user_id
WHERE `order`.user_id IS NULL
  AND like_res.user_id IS NULL
  AND rate_res.user_id IS NULL;

