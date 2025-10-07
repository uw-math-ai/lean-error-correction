theorem lean_workbook_plus_3721 (X : Type*) [MetricSpace X]
  (α : ℝ) (hα : 0 < α ∧ α < 1) (f : X → X) (hf : ∀ x y, dist (f x) (f y) ≤ α * dist x y) :
  Continuous (λ x => dist (f x) x)   := by
  apply Continuous.dist
  refine continuous_iff_continuousAt.2 fun x => ?_
  apply continuousAt_of_locally_lipschitz zero_lt_one
  intro y h
  exacts [hf _ _, continuous_id]