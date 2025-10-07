theorem lean_workbook_plus_5252 {A B : Matrix (Fin n) (Fin n) ℝ} (hAB : A * B = B * A) (hA : A - B = 0) : A.det = B.det   := by
  classical
  simp [sub_eq_zero] at hA
  simp [hA, hAB]