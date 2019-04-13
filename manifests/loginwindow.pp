# manage common loginwindow settings
class mac_profile::loginwindow (
  $ensure                 = 'present',
  # PayloadDisplayName: `Login Window: Global Preferences`
  $fast_user_switching_enabled  = true,
  $auto_logout_delay            = 0,

  # PayloadDisplayName: `Login Window: MCX Preferences`
  $guest_enabled                = false,
  $guest_disbled                = !$guest_enabled,

  # PayloadDisplayName: `Login Window`
  ##$show_input_menu        = true,
  $show_fullname                = true,
  $hide_local_users             = true,
  $include_network_user         = false,
  $hide_admin_users             = true,
  $hide_mobile_accounts         = true,
  $disable_console_access       = true,
  $local_user_login_enabled     = true,
  $external_accounts_enabled    = false,
  $restart_button_disabled      = false,
  $sleep_button_disabled        = false,
  $shutdown_button_disabled     = false,
  $show_other_users_managed     = true,
  $admin_may_disable_MCX        = true,
  $disable_auto_login           = true,
  $retries_until_hint           = 0,
  $loginwindow_text             = '',

  # PayloadDisplayName: `Login Window: Scripts`
  $skip_login_hook              = false,
  $skip_logout_hook             = false,

  # PayloadDisplayName: `Login Window Settings`
  $payload_removal_disallowed   = false

) inherits mac_profile {

  mac_profiles_handler::manage { "${::profile_identifier_prefix}.loginwindow":
    ensure      => $ensure,
    file_source => template('mac_profile/loginwindow.mobileconfig.erb'),
    type        => 'template',
  }
}
