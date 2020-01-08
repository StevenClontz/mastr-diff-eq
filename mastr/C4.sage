class C4(MastrExercise):
  @classmethod
  def title(self):
    return "C4 - Homogeneous second-order linear ODE"

  def generate(self):
    t = var("t")
    c1 = var("c_1")
    c2 = var("c_2")
    k1 = var("k_1")
    k2 = var("k_2")
    y = var("y2",latex_name="y")
    yp = var("y1",latex_name="y'")
    ypp = var("y0",latex_name="y''")

    if choice([True,False]):
      # pick a for (D-a)^2
      a = randrange(1,11)*choice([-1,1])

      ode = (ypp-2*a*yp+a^2*y == 0)
      ode_sol = (y==k2*exp(a*t)+k1*t*exp(a*t))
      has_complex_sol = False
      complex_sol = 0

    else:
      # pick a,b for (D-a)^2y+b^2=y''-2ay'+a^2+b^2
      a = randrange(1,6)*choice([-1,1])
      b = randrange(1,6)

      ode = (ypp-2*a*yp+(a^2+b^2)*y == 0)
      ode_sol = (y==exp(a*t)*(k1*cos(b*t)+k2*sin(b*t)))
      has_complex_sol = True
      complex_sol = (y==c1*exp((a+b*i)*t)+c2*exp((a-b*i)*t))
    
    return {
      "ode": latex(ode),
      "ode_sol": latex(ode_sol),
      "has_complex_sol": has_complex_sol,
      "complex_sol": latex(complex_sol),
    }
