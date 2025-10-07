theorem lean_workbook_plus_9130 {f : ℝ → ℝ} {x : ℝ} :
  UniformContinuousOn f (Set.Icc x (x + 1)) ↔
    ∀ ε > 0, ∃ δ > 0, ∀ t1 t2 : ℝ, t1 ∈ Set.Icc x (x + 1) ∧ t2 ∈ Set.Icc x (x + 1) ∧
      |t1 - t2| < δ → |f t1 - f t2| < ε   := by
  simp only [Metric.uniformContinuousOn_iff, Metric.ball, dist_eq_norm, Real.norm_eq_abs]
  refine' forall₂_congr fun ε hε => _
  aesop