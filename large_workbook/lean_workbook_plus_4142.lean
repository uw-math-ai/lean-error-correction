theorem lean_workbook_plus_4142 (E : Type*) [MetricSpace E] (f : E → ℝ)
    (hf : ∀ a : ℝ, IsOpen {x | f x < a} ∧ IsOpen {x | f x > a}) :
    Continuous f   := by
  refine' continuous_iff_continuousAt.2 fun x => _
  refine' tendsto_order.2 ⟨fun b hb => _, fun b hb => _⟩
  exacts [hf _ |>.2.mem_nhds hb, hf _ |>.1.mem_nhds hb]