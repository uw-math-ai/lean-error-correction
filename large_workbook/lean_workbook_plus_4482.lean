theorem lean_workbook_plus_4482 (A B : Matrix (Fin 2) (Fin 2) ℚ) (hA : A =![![1, 1],![0, 0]]) (hB : B =![![1, 1],![0, 0]]) : A * B = B * A ∧ A * B = A^2 ∧ A * B = A   := by
  simp [hA, hB, sq]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, hA, hB]