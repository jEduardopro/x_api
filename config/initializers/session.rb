config = Rails.application.config
# same_site is default to lax
# Rails.application.config.action_dispatch
config.session_store :cookie_store,
                     key: 'x_app',
                     expire_after: 14.days,
                     secure: Rails.env.production? ? true : false,
                     same_site: Rails.env.production? ? :none : :lax

config.middleware.use ActionDispatch::Cookies
# config.middleware.use ActionDispatch::Session::CookieStore
config.middleware.use config.session_store, config.session_options