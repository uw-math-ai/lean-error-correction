theorem lean_workbook_plus_8759 : 6 * tan A = 6 * tan A ^ 3 ↔ tan A * (tan A ^ 2 - 1) = 0   := by
  constructor <;> intro h <;> linarith