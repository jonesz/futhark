-- ==
-- input {
--   [[1,2],[3,4]]
--   [[5,6],[7,8]]
-- }
-- output {
--   [[1,2],[3,4],[5,6],[7,8]]
-- }
let main(a: [][]i32) (b: [][]i32): [][]i32 =
  concat a b
