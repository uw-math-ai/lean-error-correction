theorem lean_workbook_plus_2806 (n : ℕ) (p : Polynomial (Fin n → ℤ)) : ∑ v in p.support, p.coeff v = p.eval (1 : Fin n → ℤ)   := by
  simp [Polynomial.eval_eq_sum, Polynomial.sum_def]