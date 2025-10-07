theorem lean_workbook_plus_7867 (x_i x_j : ℝ) (h : x_i > x_j) :
  x_i * x_j * (x_i - x_j) < (x_i ^ 2 + x_i * x_j + x_j ^ 2) * (x_i - x_j)   := by
  have h1 : 0 < (x_i - x_j) ^ 2 := sq_pos_of_pos (sub_pos.mpr h)
  nlinarith [sq_nonneg (x_i - x_j), sq_nonneg (x_i + x_j)]