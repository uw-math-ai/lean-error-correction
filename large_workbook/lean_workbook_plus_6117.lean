theorem lean_workbook_plus_6117 : ∃ A B : Matrix (Fin 2) (Fin 2) (ZMod 2), A * B - B * A = 1   := by
  refine' ⟨![![1,1],![0,1]],![![1,0],![1,1]], by decide⟩