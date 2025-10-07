theorem lean_workbook_plus_8357 (E : Type) (g : E → E) (a : E) : ∃! f : ℕ → E, f 0 = a ∧ ∀ n, f (n + 1) = g (f n)   := by
  exact ⟨fun n ↦ Nat.rec a (fun _ ↦ g) n, ⟨rfl, fun _ ↦ rfl⟩, fun f hf ↦ by
  simp only [forall_and, forall_const] at hf
  ext n
  induction n <;> simp_all⟩