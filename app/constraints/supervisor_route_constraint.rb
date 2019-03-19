class SupervisorRouteConstraint
  def matches?(request)
    user = request.env["warden"].user(:user)
    user.role_id == 3 if user
  end
end
