# Configure screen saver while logged in
class mac_profile::screen_saver (
  $ensure                 = 'present',

  # PayloadDisplayName: `Screen Saver – User`
  $idle_time                  = 1200, # seconds
  $screen_saver_path          = undef, # e.g. '/System/Library/Frameworks/ScreenSaver.framework/Resources/Computer Name.saver',

  # PayloadDisplayname: `Screen Saver`
  $ask_for_password           = true,
  $ask_for_password_delay     = 0,
  $login_window_module_path   = $screen_saver_path,
  $login_window_idle_time     = $idle_time,

  # PayloadDisplayName: `Settings for Devices`
  $payload_removal_disallowed   = false

) inherits mac_profile {

  mac_profiles_handler::manage { "${::profile_identifier_prefix}.screen_saver":
    ensure      => $ensure,
    file_source => template('mac_profile/screen_saver.mobileconfig.erb'),
    type        => 'template',
  }
}
