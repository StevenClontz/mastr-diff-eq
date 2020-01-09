class C5(MastrExercise):
  @classmethod
  def title(self):
    return "C5 - Homogeneous second-order linear IVP"

  def generate(self):
    t = var("t")
    y = var("y2",latex_name="y")
    yp = var("y1",latex_name="y'")
    ypp = var("y0",latex_name="y''")

    if choice([True,False]):
      # pick a,b for (D-a)(D-b)
      a = randrange(1,6)*choice([-1,1])
      b=a
      while a==b:
        b = randrange(1,6)*choice([-1,1])
      # pick particular solution
      k1 = randrange(-5,6)
      k2 = k1
      while k2==k1:
        k2 = randrange(-5,6)
      ode = (ypp-(a+b)*yp+a*b*y==0)
      ivp_sol = (y == k1*exp(a*t)+k2*exp(b*t))
      iv1 = k1+k2
      iv2 = a*k1+b*k2
    else:
      # pick a for D^2+a^2
      a = randrange(2,11)
      # pick particular solution
      k1 = randrange(-5,6)
      k2 = k1
      while k2==k1:
        k2 = randrange(-5,6)
      ode = (ypp+a^2*y==0)
      ivp_sol = (y == k1*sin(a*t)+k2*cos(a*t))
      iv1 = k2
      iv2 = a*k1
    
    return {
      "ivp":
        latex(ode) + "\hspace{1em} y(0) = " +
        latex(iv1) +
        ", y'(0) =" +
        latex(iv2),
      "ivp_sol":
        latex(ivp_sol)
    }
