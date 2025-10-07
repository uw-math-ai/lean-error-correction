theorem lean_workbook_plus_5305 : ∀ n, ∑ i in Finset.range n, (1/2)^i < 2   := by
  refine' Nat.rec _ _
  exacts [by norm_num, fun n ih => by norm_num [ih]]