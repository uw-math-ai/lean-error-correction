theorem lean_workbook_plus_2165 (a b c d w x y z : ℝ) : (a^2+b^2+c^2+d^2)*(w^2+x^2+y^2+z^2) = (a*w+b*x+c*y+d*z)^2+(a*x-b*w+c*z-d*y)^2+(a*y-b*z-c*w+d*x)^2+(a*z+b*y-c*x-d*w)^2   := by
  ring