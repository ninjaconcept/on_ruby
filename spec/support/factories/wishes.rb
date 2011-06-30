# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :wish do |f|
  f.name "The xing mobile website: touch.xing.com"
  f.description "The xing mobile web app team would like to present our new website: touch.xing.com at the next rails usergroup, if possible. We would introduce jquery mobile and rails 3 integration. I expect 30-45 minutes."
  f.activity Wish::ACTIVITIES.first
  f.association :user
end
