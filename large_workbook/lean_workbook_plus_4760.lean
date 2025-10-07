theorem lean_workbook_plus_4760 : ¬IsClosed (Set.Ico (0 : ℝ) 1)   := by
  rw [isClosed_iff_clusterPt]
  push_neg
  refine ⟨1, ?_, by norm_num⟩
  exact mem_closure_iff_clusterPt.1 (by simp)