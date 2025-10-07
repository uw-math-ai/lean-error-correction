theorem lean_workbook_plus_9562 : ∀ x y z s : ℝ, (x^2 + y^2 + z^2 - 5 = s^2 - 6 * s + 9 → (s - 3)^2 >= 0)   := by
  exact fun x y z s h ↦ by nlinarith [h]