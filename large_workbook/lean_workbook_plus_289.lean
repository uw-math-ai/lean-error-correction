theorem lean_workbook_plus_289 (a b c : ℝ) :
  a^4 * b^2 + b^4 * c^2 ≥ 2 * b^3 * a^2 * c ∧
  a^4 * b^2 + c^4 * a^2 ≥ 2 * a^3 * c^2 * b ∧
  b^4 * c^2 + c^4 * a^2 ≥ 2 * c^3 * b^2 * a   := by
  refine ⟨by nlinarith [sq_nonneg (a^2 - b*c), sq_nonneg (b^2 - c*a), sq_nonneg (c^2 - a*b)], by nlinarith [sq_nonneg (a^2 - c*b), sq_nonneg (b^2 - a*c), sq_nonneg (c^2 - b*a)], by nlinarith [sq_nonneg (b^2 - a*c), sq_nonneg (c^2 - b*a), sq_nonneg (a^2 - c*b)]⟩