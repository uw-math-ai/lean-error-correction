theorem lean_workbook_plus_374 (x : ℝ) (hx: x ≠ 0) (h2x: x ≠ π/2) : 2 * cos x / abs (sin x) * (2 * sin x / abs (cos x)) = 4 * cos x * sin x / (abs (sin x) * abs (cos x))   := by
  ring_nf