theorem lean_workbook_plus_7377 {α : Type} [AddCommMonoid α] (f : α → α → α → α) (a b c : α) :
  f a b c + f a c b + f b a c + f b c a + f c a b + f c b a = (fun x y z => f x y z + f x z y + f y x z + f y z x + f z x y + f z y x) a b c   := by
  simp only [add_assoc, add_left_comm, add_comm]