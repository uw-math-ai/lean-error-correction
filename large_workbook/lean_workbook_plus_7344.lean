theorem lean_workbook_plus_7344 {m : ℤ} (f : ℤ → ℤ) (hf: f = fun n => if n % 2 = 0 then n-1 else n+1) : ∀ n ≤ 2*m, f n = if n % 2 = 0 then n-1 else n+1   := by
  exact fun n hn => hf ▸ rfl