User.create!(
  admin: true,
  username: "ademiro",
  email: "me@administrador.com",
  password: "password",
  password_confirmation: "password",
  confirmed_at: Time.current
)