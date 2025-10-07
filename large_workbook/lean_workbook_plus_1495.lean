theorem lean_workbook_plus_1495 (a b : ℝ) : (a^2011+b^2011)*(a+b)-a*b*(a^2010+b^2010)=a^2012+b^2012   := by
  nlinarith [sq_nonneg (a^2011 - b^2011), sq_nonneg (a^2011 - 1), sq_nonneg (b^2011 - 1)]