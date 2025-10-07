theorem lean_workbook_plus_9916 (A : Matrix (Fin 3) (Fin 3) ℝ) (hA : A =![![-2, 1, 2],![4, 1, -2],![-6, -3, 4]]) : ∃ (L U : Matrix (Fin 3) (Fin 3) ℝ), A = L * U ∧ L.det ≠ 0 ∧ U.det ≠ 0   := by
  use (1 : Matrix (Fin 3) (Fin 3) ℝ), A
  norm_num [hA, Matrix.det_fin_three]