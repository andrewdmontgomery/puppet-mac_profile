# skip default Setup prompts that happen upon first user login
class mac_profile::setup_assistant (
  $ensure                 = 'present',

  # PayloadDisplayName: `Skip Setup Assistants`
  $skip_appearance_setup        = false,
  $skip_cloud_setup             = false,
  $skip_privacy_setup           = false,
  $skip_siri_setup              = false,
  $skip_truetone_setup          = false,
  $skip_iCloud_storage_setup    = false,

  # PayloadDisplayName: `Setup Assistants`
  $payload_removal_disallowed   = false

) inherits mac_profile {

  mac_profiles_handler::manage { "${::profile_identifier_prefix}.setup_assistant":
    ensure      => $ensure,
    file_source => template('mac_profile/setup_assistant.mobileconfig.erb'),
    type        => 'template',
  }
}
