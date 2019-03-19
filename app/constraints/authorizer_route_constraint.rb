class AuthorizerRouteConstraint
  def matches?(request)
    user = request.env["warden"].user(:user)
    user.role_id == 2 if user
  end
end
