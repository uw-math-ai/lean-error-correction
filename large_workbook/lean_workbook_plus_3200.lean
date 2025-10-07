theorem lean_workbook_plus_3200 (X : Type) [MetricSpace X]
  (f : X → X) (hf : Continuous f) : Continuous (λ x => dist (f x) x)   := by
  exact continuous_dist.comp (hf.prod_mk continuous_id)