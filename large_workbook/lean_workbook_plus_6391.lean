theorem lean_workbook_plus_6391 (a : ℝ) (z : ℂ) (h : ∀ θ : ℝ, ‖(a + Real.cos θ) + (2 * a - Real.sin θ) * Complex.I‖ ≤ 2) : -2 ≤ a ∧ a ≤ 2   := by
  have h₁ := h 0
  have h₂ := h π
  simp [Complex.norm_eq_abs] at h₁ h₂
  simp [Complex.abs_apply, Complex.norm_eq_abs] at h₁ h₂
  have h₃ : 0 ≤ a ^ 2 := sq_nonneg a
  have h₄ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₅ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₆ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₇ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₈ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₉ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₀ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₁ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₂ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₃' : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₄' : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by positivity
  have h₁₃ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₄ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₅ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₆ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₇ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₈ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₁₉ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₀ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by positivity
  have h₂₁ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by positivity
  have h₂₂ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₃ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₄ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₅ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₆ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₇ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₈ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₉ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₀ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₁ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₂ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₃ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₄ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₅ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₆ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₇ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₈ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₉ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₂ : 0 ≤ a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  have h₂₁₂ : 0 < a ^ 2 + 1 + 4 * a ^ 2 := by nlinarith
  simp [Real.sqrt_le_left] at h₁ h₂
  have h₃ : 0 ≤ (a + 1 + 2 * a * Complex.I).re ^ 2 + (a + 1 + 2 * a * Complex.I).im ^ 2 := by positivity
  norm_num at h₃
  simp [Complex.normSq_apply] at h₁ h₂
  constructor <;> nlinarith [h₁, h₂]