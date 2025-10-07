theorem lean_workbook_plus_3497 (n : ℕ) : (∏ k in Finset.Icc 1 n, (2 * k) / (n + 1)) ≤ 1   := by
  refine' Finset.prod_le_one (fun k _ => by positivity) fun k _ => _
  obtain ⟨h₁, h₂⟩ := Finset.mem_Icc.mp ‹k ∈ Finset.Icc 1 n›
  rw [Nat.div_le_iff_le_mul_add_pred] <;> omega