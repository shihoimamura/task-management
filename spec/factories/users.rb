FactoryBot.define do
  factory :user do
    name { 'vivi' }
    email { 'vivi@com' }
    password { 'vivivivi' }
    admin { 'false' }
  end
  factory :second_user, class: User do
    name { 'bibi' }
    email { 'bibi@com' }
    password { 'bibibibi' }
    admin { 'false' }
  end
  factory :third_user, class: User do
    name { 'admin' }
    email { 'admin@com' }
    password { 'admin_password' }
    admin { 'true' }
  end
end
