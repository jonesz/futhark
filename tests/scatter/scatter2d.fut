-- ==
-- input { [[1,2,3],[4,5,6],[7,8,9]] [1i64, 1i64] [1i64, -1i64] [42, 1337] }
-- output { [[1,2,3],[4,42,6],[7,8,9]] }
-- input { [[1,2,3],[4,5,6],[7,8,9]] [-1i64] [-1i64] [1337] }
-- output { [[1,2,3],[4,5,6],[7,8,9]] }
-- input { [[1,2,3],[4,5,6],[7,8,9]] [3i64] [0i64] [1337] }
-- output { [[1,2,3],[4,5,6],[7,8,9]] }
-- input { [[1,2,3],[4,5,6],[7,8,9]] [0i64] [3i64] [1337] }
-- output { [[1,2,3],[4,5,6],[7,8,9]] }
-- input { [[1,2,3],[4,5,6],[7,8,9]] [-1i64] [0i64] [1337] }
-- output { [[1,2,3],[4,5,6],[7,8,9]] }
-- input { [[1,2,3],[4,5,6],[7,8,9]] [0i64] [-1i64] [1337] }
-- output { [[1,2,3],[4,5,6],[7,8,9]] }
-- input { [[1,2,3],[4,5,6],[7,8,9]] [0i64] [0i64] [1337] }
-- output { [[1337,2,3],[4,5,6],[7,8,9]] }
-- input { [[1,2,3],[4,5,6],[7,8,9]] [3i64] [3i64] [1337] }
-- output { [[1,2,3],[4,5,6],[7,8,9]] }
def main [n][m][l] (xss: *[n][m]i32) (is: [l]i64) (js: [l]i64) (vs: [l]i32): [n][m]i32 =
  scatter_2d xss (zip is js) vs
