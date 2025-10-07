theorem lean_workbook_plus_7512 {R : Type*} [CommRing R]
  {A B : Matrix (Fin 2) (Fin 2) R} (h : A.trace = B.trace) :
  (B - A).trace = 0   := by
  rw [Matrix.trace_sub, h, sub_self]