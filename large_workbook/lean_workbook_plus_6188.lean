theorem lean_workbook_plus_6188 {a b : ℤ} (h : a ∣ b) : a ∣ a + b   := by
  simpa only [add_comm] using dvd_add h (dvd_refl a)