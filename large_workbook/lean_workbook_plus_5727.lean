theorem lean_workbook_plus_5727 (a b c α β γ : ℝ) (hx: a > 0 ∧ b > 0 ∧ c > 0) (hab : a + b > c) (hbc : b + c > a) (hca : a + c > b) (hα: α = (b + c) / a) (hβ: β = (c + a) / b) (hγ: γ = (a + b) / c) : (α + β + γ + 2 = α * β * γ ∧ 2 * (α + β + γ) ≤ α * β + β * γ + γ * α)   := by
  norm_num [hα, hβ, hγ, hx.1, hx.2.1, hx.2.2, hab, hbc, hca]
  obtain ⟨h₁, h₂, h₃⟩ := hx
  constructor <;> field_simp <;> ring
  field_simp [h₁, h₂, h₃]
  apply (div_le_div_iff (by positivity) (by positivity)).mpr
  apply le_of_sub_nonneg
  apply le_of_sub_nonneg
  ring_nf
  apply le_of_sub_nonneg
  apply le_of_sub_nonneg
  nlinarith [sq_nonneg (b * c * a * (b - c)), sq_nonneg (b * c * a * (c - a)), sq_nonneg (b * c * a * (a - b))]