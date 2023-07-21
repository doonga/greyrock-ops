resource "auth0_connection" "passwordless_email" {
  strategy = "email"
  name     = "email"

  options {
    name                     = "email"
    from                     = "{{ application.name }} <auth0@m.greyrock.io>"
    subject                  = "Welcome to {{ application.name }}"
    syntax                   = "liquid"
    template                 = file("${path.module}/templates/passwordless_email_template.txt")
    disable_signup           = true
    brute_force_protection   = true
    # set_user_root_attributes = "on_each_login"
    non_persistent_attrs     = []
    auth_params = {
      scope         = "openid email profile offline_access"
      response_type = "code"
    }

    totp {
      time_step = 300
      length    = 6
    }
  }
}
