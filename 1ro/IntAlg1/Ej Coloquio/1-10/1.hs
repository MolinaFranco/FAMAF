mayoresQue:: Int -> [Int] -> [Int]
mayoresQue y [] = []
mayoresQue y (x:xs) | y>=x = mayoresQue y xs
                    | y<x = n:mayoresQue y xs