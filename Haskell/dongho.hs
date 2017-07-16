main = undefined

factorial_naive :: (Integral a) => a -> a
factorial_naive 0 = 1
factorial_naive n = n * factorial_naive(n-1)

factorial_product :: (Integral a) => a -> a
factorial_product n = product [1..n]

fibonachi_naive :: (Integral a) => a -> a
fibonachi_naive 0 = 1
fibonachi_naive 1 = 1
fibonachi_naive n = fibonachi_naive(n-1) + fibonachi_naive(n-2)

reverse_naive :: [a] -> [a]
reverse_naive [] = []
reverse_naive xs = [last xs] ++ reverse_naive(init xs)

removeUppercase :: [Char] -> [Char]
removeUppercase xs = [c | c <- xs, not (c `elem` ['A'..'Z'])]

evenFilter :: (Integral a) => [a] -> [a]
evenFilter xs = [x | x <- xs, even x]

maximum_recursive :: (Ord a) => [a] -> a
maximum_recursive []  = error "maximum of empty list"
maximum_recursive [x] = x
maximum_recursive (x:xs)
    | x > maxTail = x
    | otherwise   = maxTail
    where maxTail = maximum_recursive xs

minimum_recursive :: (Ord a) => [a] -> a
minimum_recursive [] = error "minimum of empty list"
minimum_recursive [x]    = x
minimum_recursive (x:xs) = x `min` (minimum_recursive xs)

replicate_recursive :: (Num i, Ord i) => i -> a -> [a]
replicate_recursive n x
    | n <= 0     =  []
    | otherwise  =  x : replicate_recursive (n-1) x

take_recursive :: (Num i, Ord i) => i -> [a] -> [a]
take_recursive n _
    | n <= 0 = []
take_recursive _ []     = []
take_recursive n (x:xs) = x : take_recursive (n-1) xs

zip_recursive :: [a] -> [b] -> [(a, b)]
zip_recursive _ [] = []
zip_recursive [] _ = []
zip_recursive (x:xs) (y:ys) = (x, y) : (zip_recursive xs ys)

elem_recursive :: (Eq a) => a -> [a] -> Bool
elem_recursive _ [] = False
elem_recursive e (x:xs)
    | e == x     =  True
    | otherwise  =  e `elem_recursive` xs

quicksort_recursive :: (Ord a) => [a] -> [a]
quicksort_recursive [] = []
quicksort_recursive (x:xs) =
    let smallerSorted = quicksort_recursive [a | a <- xs, a <= x]
	biggerSorted  = quicksort_recursive [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted

