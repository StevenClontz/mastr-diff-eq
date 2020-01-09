class F5(MastrExercise):
  @classmethod
  def title(self):
    return "F5: First order linear IVP" 

  def generate(self):
    t = var("t")
    y = var("y2",latex_name="y")
    yp = var("y1",latex_name="y'")
    
    # pick n for y=kx^n
    n = randrange(2,6)*choice([-1,1])
    # pick initial value
    t0 = choice([-1,1])
    # pick coefficient
    k = randrange(1,5)*choice([-1,1])
    hom_sol = k*t^n
    # particular solution
    kp = randrange(1,6)*choice([-1,1])
    m = n
    while m==n:
      m = randrange(1,5)*choice([-1,1])
    part_sol = choice([
      kp*t^m
    ])
    ts = n*part_sol-t*part_sol.diff()
    roll = randrange(0,4)
    if roll==0:
      ode = (ts+t*yp==n*y)
    elif roll==1:
      ode = (ts==-t*yp+n*y)
    elif roll==2:
      ode = (t*yp-n*y==-ts)
    else:
      ode = (n*y==t*yp+ts)
    ivp_sol = (y==k*t^n+part_sol)
   
    return { 
      "ivp":
        latex(ode)+
        "\hspace{1em} y(" +
        latex(t0) +
        ") = " +
        latex(hom_sol(t=t0)+part_sol(t=t0)),
      "ivp_sol": latex(ivp_sol)
    }
