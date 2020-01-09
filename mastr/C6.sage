class C6(MastrExercise):
  @classmethod
  def title(self):
    return "C6 - Non-homogeneous second-order linear ODEs"

  def generate(self):
    t = var("t")
    y = var("y2",latex_name="y")
    yp = var("y1",latex_name="y'")
    ypp = var("y0",latex_name="y''")
    
    # pick a,b for (D-a)(D-b)
    a = randrange(1,6)*choice([-1,1])
    b=a
    while a==b:
      b = randrange(1,6)*choice([-1,1])
    # pick particular solution
    c=a
    while c in [a,b]:
      c = randrange(1,6)*choice([-1,1])
    d = randrange(1,6)*choice([-1,1])
    ypart = choice([
      d*exp(c*t)
    ])
    k1 = var("k_1")
    k2 = var("k_2")
    ode = (ypp-(a+b)*yp+a*b*y==ypart.diff().diff()-(a+b)*ypart.diff()+a*b*ypart)
    ode_sol = (y==k1*exp(a*t)+k2*exp(b*t)+ypart)
    
    return {
      "ode": latex(ode),
      "ode_sol": latex(ode_sol)
    }
