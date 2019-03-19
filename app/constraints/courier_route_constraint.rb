class CourierRouteConstraint
  def matches?(request)
    user = request.env["warden"].user(:user)
    user.role_id == 1 if user
  end
end
