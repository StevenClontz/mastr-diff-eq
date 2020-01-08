class C1(MastrExercise):
  @classmethod
  def title(cls):
    return "C1 - Homogeneous first-order linear ODE"

  def generate(self):
    t = var("t")
    y = var("y1",latex_name="y")
    if choice([True,False]):
      yp = var("y0",latex_name="y'")
    else:
      yp = var("y2",latex_name="y'")
    k = var('k')   
    
    # pick a for y'-ay
    a = randrange(1,10)*choice([-1,1])
    b = choice([-1,1])*randrange(2,6)
    ode = (b*yp-b*a*y==0)
    if choice([True,False]):
      ode += (b*a*y==b*a*y)
    if choice([True,False]):
      ode += (-b*yp==-b*yp)

 
    return {
      "ode": latex(ode),
      "ode_sol": "y="+latex(k*exp(a*t))
    }
