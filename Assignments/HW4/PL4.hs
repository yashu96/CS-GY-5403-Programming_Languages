import Data.List


rev ::[a]->[a]
rev [] = []
rev (l1:xs) = rev(xs)++[l1]


unionlist :: (Eq a) => [a] -> [a] -> [a]
unionlist xs ys = xs ++ unionlist ys xs
    where unionlist [] _ = []
          unionlist (a:as) first = if (a `elem` first) then unionlist as first else a : unionlist as (a:first)


bsort :: (Ord a) => [a] -> [a]
bsort [] = []
bsort (x:xs) =
    let smallerSorted = bsort [a | a <- xs, a <= x]
        biggerSorted = bsort [a | a <- xs, a > x]
    in  smallerSorted ++ [x] ++ biggerSorted


maxf s a
      | null s = a
      | (>) (head s) a = maxf (tail s) (head s)
      | otherwise = maxf (tail s) a

minf s a
      | null s = a
      | (<) (head s) a = minf (tail s) (head s)
      | otherwise = minf (tail s) a

maxmin s
      | null s = []
      | otherwise = [maxf s (head s)] ++ [minf s (head s)]


perm :: [a] -> [[a]]
perm [] = [[]]
perm xs = [ y:zs | (y,ys) <- select xs, zs <- perm ys]
  where select []     = []
        select (l1:xs) = (l1,xs) : [ (y,l1:ys) | (y,ys) <- select xs ]
