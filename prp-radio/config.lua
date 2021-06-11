Config = {}

Config.RestrictedChannels = 10 -- channels that are encrypted (EMS, Fire and police can be included there) if we give eg 10, channels from 1 - 10 will be encrypted

Config.MaxFrequency = 500

Config.messages = {
  ['not_on_radio'] = 'You are not connected on the radio',
  ['on_radio'] = 'You are already connected to this frequency: <b>',
  ['joined_to_radio'] = 'You have been joined: <b>',
  ['restricted_channel_error'] = 'You cant join this protected frequency!',
  ['you_on_radio'] = 'You are already on this frequency: <b>',
  ['you_leave'] = 'You have left the frequency: <b>',
  ['you_off_duty'] = 'You need to go on-duty to join this channel'
}