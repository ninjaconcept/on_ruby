# encoding: utf-8

Whitelabel.destroy_all

hamburg = Whitelabel.create!(
  name: 'Ruby Usergroup Hamburg',
  subdomain: 'hamburg')

cologne = Whitelabel.create!(
  name: 'Cologne.rb',
  subdomain: 'cologne')

Location.destroy_all

blau = Location.create!(
  name: 'blau Mobilfunk GmbH',
  url: 'http://www.blaumobilfunk.de',
  street: 'Schulterblatt',
  house_number: '124',
  city: 'Hamburg',
  zip: '20357',
  lat: 53.56544,
  long: 9.95947,
  company: true,
  whitelabel: hamburg)

mindmatters = Location.create!(
  name: 'mindmatters GmbH & Co. KG',
  url: 'http://mindmatters.de',
  street: 'Neuer Kamp',
  house_number: '30',
  city: 'Hamburg',
  zip: '20357',
  lat: 53.557646,
  long: 9.96769,
  company: true,
  whitelabel: hamburg)

avocado_store = Location.create!(
  name: 'Avocado Store GmbH',
  url: 'http://avocadostore.de',
  street: 'Schulterblatt',
  house_number: '36',
  city: 'Hamburg',
  zip: '20357',
  lat: 53.56059,
  long: 9.963119,
  company: true,
  whitelabel: hamburg)

ubilabs = Location.create!(
  name: 'Ubilabs GmbH Internet',
  url: 'http://ubilabs.net',
  street: 'Juliusstraße',
  house_number: '25',
  city: 'Hamburg',
  zip: '22769',
  lat: 53.561108,
  long: 9.961681,
  company: true,
  whitelabel: hamburg)

lb_lab = Location.create!(
  name: 'lb-lab GmbH',
  url: 'http://lb-lab.de',
  street: 'Burchardstraße',
  house_number: '19',
  city: 'Hamburg',
  zip: '20095',
  lat: 53.549253,
  long: 10.000313,
  company: true,
  whitelabel: hamburg)

dynport = Location.create!(
  name: 'Dynport GmbH',
  url: 'http://dynport.de',
  street: 'Große Theaterstraße',
  house_number: '39',
  city: 'Hamburg',
  zip: '20354',
  lat: 53.556385,
  long: 9.990486,
  company: true,
  whitelabel: hamburg)

akra = Location.create!(
  name: 'Akra GmbH',
  url: 'http://akra.de',
  street: 'Domstraße',
  house_number: '17',
  city: 'Hamburg',
  zip: '20357',
  lat: 53.548191,
  long: 9.994548,
  company: true,
  whitelabel: hamburg)

User.destroy_all

Authorization.create_from_hash({
  "provider"=>"twitter",
  "uid"=>"14339524",
  "info"=>{
    "nickname"=>"phoet",
    "name"=>"Peter Schröder",
    "location"=>"Sternschanze,Hamburg",
    "image"=>"http://a3.twimg.com/profile_images/1100439667/P1040913_normal.JPG",
    "description"=>"I am a freelance Ruby and Java developer from Hamburg,Germany. ☠ nofail",
    "urls"=>{"Website"=>"http://nofail.de"}
  }
})

peter = User.first
peter.update_attribute(:admin, true)

Event.destroy_all

event = Event.create!(
  name: 'Rails Usergroup Hamburg — Weihnachtstreffen',
  date: DateTime.parse('2010/12/08 19:00'),
  description: 'Die Hamburger Usergroup trifft sich an jedem 2. Mittwoch des Monats an unterschiedlichen Orten. Das Dezember-Treffen findet bei blau.de Mobilfunk in der Schanze statt. Da es sich um das Weihnachtstreffen handelt,wird es Glühwein,
  Gebäck und Liederzettel geben.',
  user: peter,
  location: blau)

Participant.destroy_all

Participant.create!(
  user: peter,
  event: event)
