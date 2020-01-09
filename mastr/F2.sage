class F2(MastrExercise):
  @classmethod
  def title(self):
    return "F2: Separation of variables"

  def generate(self):
    t = var("t")
    y = var("y2",latex_name="y")
    yp = var("y1",latex_name="y'")
    ypp = var("y0",latex_name="y''")
    
    if choice([True,False]):
      # pick n for y=kx^n
      n = randrange(2,4)*choice([-1,1])
      # pick initial value
      t0 = randrange(1,5)*choice([-1,1])
      # pick coefficient
      k = randrange(1,5)*choice([-1,1])
      roll = randrange(0,4)
      if roll==0:
        ode = (t*yp==n*y)
      elif roll==1:
        ode = (t*yp-n*y==0)
      elif roll==2:
        ode = (0==-t*yp+n*y)
      else:
        ode = (n*y==t*yp)
      ivp_sol = (y == k*t^n)
      iv = k*t0^n
    else:
      # pick p(t) for y=e^p(t)
      p = choice([
        randrange(1,4)*choice([-1,1])*
          t^2+randrange(-3,4)*t+randrange(-5,6),
        randrange(1,4)*choice([-1,1])*cos(t),
        randrange(1,4)*choice([-1,1])*sin(t)
      ])
      # pick coefficient
      k = randrange(1,5)*choice([-1,1])
      roll = randrange(0,4)
      if roll==0:
        ode = (yp==p.diff()*y)
      elif roll==1:
        ode = (p.diff()*y==yp)
      elif roll==2:
        ode = (p.diff()*y-yp==0)
      else:
        ode = (0==-p.diff()*y+yp)
      ivp_sol = (y==k*exp(p))
      t0=0
      iv = k*exp(p(t=t0))
   
    return { 
      "ivp":
        latex(ode) +
        "\hspace{1em} y(" +
        latex(t0) +
        ") = " +
        latex(iv),
      "ivp_sol": latex(ivp_sol)
    }
