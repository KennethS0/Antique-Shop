SELECT product.id 
FROM product INNER JOIN ad.parameter as par ON par.name = "product_search_keyword"
WHERE productname LIKE CONCAT('%',par.value,'%');