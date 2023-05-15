# used to set the expering date for the sessions
Rails.application.config.session_store :cookie_store, key: '_event_platform_session'

# time for expiry

Rails.application.config.session_store :cookie_store, key: '_event_platform_session', expire_after: 7.days
