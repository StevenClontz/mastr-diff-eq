class D1(MastrExercise):
  @classmethod
  def title(cls):
    return "D1 - Laplace transform. Compute the Laplace transform of a function from the definition."

  def generate(self):
    """
    Generates one of the following:
    kt^b
    ksin(bt)
    kcos(bt)
    Plus one of the following:
    ke^{bt}+m*\delta(t-a)
    ke^{bt}+m*u(t-a)
    """
    t = var("t")
    s = var("s")
    d = function("delta",latex_name="\\delta")
    u = function("u")
    k = choice([-1,1])*randrange(1,5)
    l = choice([-1,1])*randrange(1,5)
    a = randrange(1,4)
    b = randrange(2,4)
    transform = choice([
      [k*t^b+l*d(t-a),k*factorial(b)/s^(b+1)+l*exp(-a*s)],
      [k*t^b+l*u(t-a),k*factorial(b)/s^(b+1)+l*exp(-a*s)/s],
      [k*sin(b*t)+l*d(t-a),k*b/(s^2+b^2)+l*exp(-a*s)],
      [k*sin(b*t)+l*u(t-a),k*b/(s^2+b^2)+l*exp(-a*s)/s],
      [k*cos(b*t)+l*d(t-a),k*s/(s^2+b^2)+l*exp(-a*s)],
      [k*cos(b*t)+l*u(t-a),k*s/(s^2+b^2)+l*exp(-a*s)/s],
    ])
 
    return {
      "pretransform": latex(transform[0]),
      "transform": latex(transform[1])
    }
