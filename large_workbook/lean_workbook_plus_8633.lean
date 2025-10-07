theorem lean_workbook_plus_8633 {X : Type*} [MetricSpace X] (E : Set X) : IsClosed (closure E)   := by
  exact isClosed_closure