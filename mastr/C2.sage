class C2(MastrExercise):
  @classmethod
  def title(self):
    return "C2 - Non-homogeneous first-order linear ODE"

  def generate(self):
    t = var("t")
    y = var("y2",latex_name="y")
    yp = var("y1",latex_name="y'")
    
    # pick a for y'-ay
    a = randrange(1,6)*choice([-1,1])
    
    # particular solution
    b=a
    while (b==a):
      b = randrange(1,6)*choice([-1,1])
    c = choice([-3,-2,2,3])
    part_sol = choice([
      c*exp(b*t),
      c*exp(a*t)*t,
      c*exp(a*t)*sin(b*t),
      c*exp(a*t)*cos(b*t)
    ])
    k = var("k")
   
    return {
      "ode": latex(yp-a*y==part_sol.diff()-a*part_sol),
      "ode_sol": "y="+latex(k*exp(a*t)+part_sol)
    }
